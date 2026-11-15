const std = @import("std");

// Author https://TheonlyOneByC 
pub fn rot(num: u8, allocator: std.mem.Allocator, t: []const u8) ![]const u8 {
    const f: []u8 = try allocator.alloc(u8, t.len);
    for (t, 0..) |c, i| {
        if (c >= 'A' and c <= 'Z') {
            f[i] = @as(u8, @intCast(@mod(c - 'A' + (num % 26), 26) + 'A'));
        } else if (c >= 'a' and c <= 'z') {
            f[i] = @as(u8, @intCast(@mod(c - 'a' + (num % 26), 26) + 'a'));
        } else {
            f[i] = c;
        }
    }
    return f;
}

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    const t : [] const u8 = "Hello";
    const f = try rot(255, allocator, t);
    std.debug.print("{s}", .{f});
    defer allocator.free(f);
}
