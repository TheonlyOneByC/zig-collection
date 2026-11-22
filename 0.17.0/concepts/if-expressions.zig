const std = @import("std");

pub fn main() !void {
const age = 16;
const response = if (age >= 18) "adult" else if(age >= 13 and age < 18) "teenager" else "kid";
std.debug.print("You are an {s}", .{response});
}