const std = @import("std");

fn toLower(allocator: std.mem.Allocator, text : [] const u8) ![] const u8 {
    const final : [] u8 = try allocator.alloc(u8, text.len);
    for (text, 0..) |char, i| {
        if (char >= 65 and char <= 90) {
           final[i] = char + 32;
        }
        else { final[i] = char; }
    }
    return final;
}

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    const result : [] const u8 = try toLower(allocator, "HELLO11 !W@34ot");
    std.debug.print("{s}", .{result});
    allocator.free(result);
}
