fn reverseString(allocator : std.mem.Allocator, text : [] const u8) ![]u8 {
    const final : [] u8 = try allocator.alloc(u8, text.len);
    for (text, 0..) | _, i | {
        final[i] = text[text.len - 1 - i];
    }
    return final;
}

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    const result : [] const u8 = try reverseString(allocator, "Hello, World!");
    std.debug.print("{s}", .{result});
    allocator.free(result);
}
