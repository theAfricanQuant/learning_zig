const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    defer {
        const deinit_status = gpa.deinit();
        if (deinit_status == .leak) {
            std.debug.print("Memory leak detected!\n", .{});
        }
    }

    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);

    if (args.len != 4) {
        try stdout.print("Usage: {s} <number> <operator> <number>\n", .{args[0]});
        return;
    }

    const number1 = try std.fmt.parseFloat(f64, args[1]);
    const operator = args[2];
    const number2 = try std.fmt.parseFloat(f64, args[3]);

    const result = switch (operator[0]) {
        '+' => number1 + number2,
        '-' => number1 - number2,
        '*' => number1 * number2,
        '/' => number1 / number2,
        '^' => std.math.pow(f64, number1, number2),
        else => {
            try stdout.print("Invalid operator: {s}\n", .{operator});
            return;
        },
    };

    try stdout.print("{d} {c} {d} = {d}\n", .{ number1, operator[0], number2, result });
}
