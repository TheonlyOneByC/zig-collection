const std = @import("std");

pub fn reverse(allocator: std.mem.Allocator, text: []const u8) ![]const u8 {
const result = try allocator.alloc(u8, text.len);
var i: usize = 0;
  
for (text) | _ | {
result[i] = text[text.len - 1 - i];
    i += 1;
    }
return result;
}

pub fn main() !void {

const allocator = std.heap.page_allocator;
const result = try reverse(allocator, "Hello");

std.debug.print("{s}", .{result});

allocator.free(result);
}
