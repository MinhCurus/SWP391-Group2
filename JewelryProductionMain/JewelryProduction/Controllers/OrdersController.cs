﻿
using JewelryProduction.Common;
using JewelryProduction.DbContext;
using JewelryProduction.DTO;
using JewelryProduction.Interface;
using JewelryProduction.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace JewelryProduction.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrdersController : ControllerBase
    {
        private readonly JewelryProductionContext _context;
        private readonly IOrderService _orderService;

        public OrdersController(JewelryProductionContext context, IOrderService orderService)
        {
            _context = context;
            _orderService = orderService;
        }



        // GET: api/Orders
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Order>>> GetOrders()
        {
            var result = await _orderService.GetOrders();
            return Ok(result);
        }

        // GET: api/Orders/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Order>> GetOrder(string id)
        {
            var result = await _orderService.GetOrder(id);

            if (result == null)
            {
                return NotFound();
            }

            return Ok(result);
        }

        // PUT: api/Orders/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutOrder(string id, OrderDTO orderDTO)
        {
            if (id != orderDTO.OrderId)
            {
                return BadRequest();
            }

            var updateOrder = await _context.Orders.FindAsync(id);
            updateOrder.ProductionStaffId = orderDTO.ProductionStaffId;
            updateOrder.OrderDate = orderDTO.OrderDate;
            updateOrder.DepositAmount = orderDTO.DepositAmount;
            updateOrder.Status = orderDTO.Status;
            updateOrder.CustomizeRequestId = orderDTO.CustomizeRequestId;
            updateOrder.PaymentMethodId = orderDTO.PaymentMethodId;
            updateOrder.TotalPrice = orderDTO.TotalPrice;


            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!OrderExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Orders
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Order>> PostOrder(OrderDTO orderDTO)
        {
            var order = new Order
            {
                OrderId = orderDTO.OrderId,
                ProductionStaffId = orderDTO.ProductionStaffId,
                OrderDate = orderDTO.OrderDate,
                DepositAmount = orderDTO.DepositAmount,
                Status = orderDTO.Status,
                CustomizeRequestId = orderDTO.CustomizeRequestId,
                PaymentMethodId = orderDTO.PaymentMethodId,
                TotalPrice = orderDTO.TotalPrice,
            };
            _context.Orders.Add(order);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (OrderExists(order.OrderId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetOrder", new { id = order.OrderId }, order);
        }
        [HttpGet("paging")]
        public async Task<IActionResult> GetAllPaging([FromQuery] OrderPagingRequest request)
        {
            var products = await _orderService.GetAllPaging(request);
            return Ok(products);
        }
        [HttpGet("staff-orders")]
        public async Task<ActionResult<PagedResult<OrderDTO>>> GetStaffOrders(
    [FromQuery] string productionStaffId,
    [FromQuery] OrderPagingRequest request,
    [FromQuery] string sortBy = "totalPrice",
    [FromQuery] string sortOrder = "asc")
        {
            var ordersQuery = _context.Orders
                .Where(o => o.ProductionStaffId == productionStaffId);

            // Apply sorting
            switch (sortBy.ToLower())
            {
                case "orderdate":
                    ordersQuery = sortOrder.ToLower() == "desc"
                        ? ordersQuery.OrderByDescending(o => o.OrderDate)
                        : ordersQuery.OrderBy(o => o.OrderDate);
                    break;
                case "totalprice":
                default:
                    ordersQuery = sortOrder.ToLower() == "desc"
                        ? ordersQuery.OrderByDescending(o => o.TotalPrice)
                        : ordersQuery.OrderBy(o => o.TotalPrice);
                    break;
            }

            var products = await _orderService.GetAllPaging(request);

            return Ok(products);
        }

        // DELETE: api/Orders/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteOrder(string id)
        {
            var order = await _context.Orders.FindAsync(id);
            if (order == null)
            {
                return NotFound();
            }

            _context.Orders.Remove(order);
            await _context.SaveChangesAsync();

            return NoContent();
        }
        [HttpGet("CheckOrderStatus/{orderId}")]
        public async Task<IActionResult> CheckOrderStatus(string orderId)
        {
            if (string.IsNullOrEmpty(orderId))
            {
                return BadRequest("Order ID is required.");
            }

            var order = await _context.Orders
                .FirstOrDefaultAsync(o => o.OrderId == orderId);

            if (order == null)
            {
                return NotFound("Order not found.");
            }

            return Ok(new { order.OrderId, order.Status });
        }
        [HttpGet("CalculateGoldWeightUsedInMonth")]
        public async Task<IActionResult> CalculateGoldWeightUsedInMonth([FromQuery] DateTime startDate, [FromQuery] DateTime endDate)
        {
            if (startDate > endDate)
            {
                return BadRequest("Start date cannot be later than end date.");
            }

            var totalGoldWeight = await _orderService.CalculateGoldWeightByTypeInMonth(startDate, endDate);
            return Ok(totalGoldWeight);
        }
        [HttpGet("CalculateGemstoneWeightUsedInMonth")]
        public async Task<IActionResult> CalculateGemstoneWeightInMonth([FromQuery] DateTime startDate, [FromQuery] DateTime endDate)
        {
            if (startDate > endDate)
            {
                return BadRequest("Start date cannot be later than end date.");
            }

            var GemWeight = await _orderService.CalculateGemstoneWeightInMonth(startDate, endDate);
            return Ok(GemWeight);
        }
        private decimal GetDeposit(decimal productCost)
        {
            decimal deposit = productCost * 0.3M;
            return deposit;
        }

        private bool OrderExists(string id)
        {
            return _context.Orders.Any(e => e.OrderId == id);
        }
    }
}
