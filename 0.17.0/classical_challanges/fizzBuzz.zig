const std = @import("std");

fn fizzBuzz(num : i32) void {

if (@rem(num, 15) == 0) {
std.debug.print("FizzBuzz\n", .{});
} else if(@rem(num, 5) == 0) {
std.debug.print("Buzz \n", .{});
} else if(@rem(num, 3) == 0) {
std.debug.print("Fizz \n", .{});
} else { std.debug.print("{d} \n", .{num});
}
}

pub fn main() void {
var i : u7 = 1;
while (i < 101) : (i += 1) fizzBuzz(i);
}
