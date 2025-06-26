# Calculator in Zig

This is a simple command-line calculator written in Zig.

## How to Compile and Run

1.  **Navigate to the `calc` directory:**

    ```bash
    cd calc
    ```

2.  **Compile the Zig code:**

    ```bash
    zig build-exe calc.zig
    ```

    This will create an executable file (e.g., `calc.exe` on Windows, `calc` on Linux/macOS).

3.  **Run the calculator:**

    ```bash
    ./calc <number1> <operator> <number2>
    ```

    Replace `<number1>` and `<number2>` with your desired numbers, and `<operator>` with one of the following:
    - `+` for addition
    - `-` for subtraction
    - `*` for multiplication
    - `/` for division
    - `^` for exponentiation (e.g., `2 ^ 3` for 2 to the power of 3)

    **Example:**

    ```bash
    ./calc 10 + 5
    ```

    **Example (Exponentiation):**

    ```bash
    ./calc 2 ^ 3
    ```

## Code Components (`calc.zig`)

-   **`std` import:** Imports the Zig standard library for functionalities like I/O, memory allocation, and argument parsing.
-   **`main` function:** The entry point of the program.
    -   **`std.io.getStdOut().writer()`:** Gets a writer for standard output to print results.
    -   **`std.heap.GeneralPurposeAllocator`:** Used for memory management. It's important to `deinit` it to check for memory leaks.
    -   **`std.process.argsAlloc` and `std.process.argsFree`:** Handle command-line arguments.
    -   **Argument validation:** Checks if exactly three arguments (two numbers and one operator) are provided.
    -   **`std.fmt.parseFloat`:** Parses the string arguments into floating-point numbers (`f64`).
    -   **`switch (operator[0])`:** Performs the calculation based on the operator.
    -   **Error handling:** Prints an error message for invalid operators.
    -   **Result output:** Prints the calculation result to the console.



---

## 📘 Calculator Project in Zig

This is a simple command-line calculator program written in Zig. It takes three command-line arguments:

```bash
./calc <number1> <operator> <number2>
```

### ✅ Supported Operators:

* `+` : Addition
* `-` : Subtraction
* `*` : Multiplication
* `/` : Division
* `^` : Exponentiation

### 🔧 Build Instructions (from WSL):

1. Open your WSL Ubuntu terminal.
2. Navigate to the project directory:

   ```bash
   cd ~/zig_projects/first_script/calc
   ```
3. Build for Linux:

   ```bash
   zig build-exe calc.zig
   ```
4. Run:

   ```bash
   ./calc 10 '^' 2
   ```

> ⚠️ Note: If you see a `.exe` output, you may have built for Windows. To ensure you're targeting Linux, use `--target native-native-gnu`.

### 🖥️ VS Code Integration

* Run `code .` from your WSL terminal to open the project in VS Code using the **Remote - WSL** extension.


---

## 🧠 Code Explanation

This program is a simple **command-line calculator** written in **Zig**. It performs basic arithmetic operations based on user input.

---

### 🔍 Code Walkthrough

```zig
const std = @import("std");
```

* Imports Zig's standard library.

---

```zig
pub fn main() !void {
```

* Entry point of the program.
* The `!void` return type means it can return an error.

---

### 🖨️ Get Standard Output

```zig
const stdout = std.io.getStdOut().writer();
```

* Gets a handle to standard output for printing messages.

---

### 🧠 Memory Allocator Setup

```zig
var gpa = std.heap.GeneralPurposeAllocator(.{}){};
const allocator = gpa.allocator();
```

* Creates a **general-purpose heap allocator** for dynamic memory usage (e.g., storing command-line arguments).

```zig
defer {
    const deinit_status = gpa.deinit();
    if (deinit_status == .leak) {
        std.debug.print("Memory leak detected!\n", .{});
    }
}
```

* Ensures memory is deallocated when `main` ends.
* Prints a warning if memory leaks are detected.

---

### 🧾 Handle Command-Line Arguments

```zig
const args = try std.process.argsAlloc(allocator);
defer std.process.argsFree(allocator, args);
```

* Allocates and stores the program's command-line arguments.
* Frees them at the end of the function.

```zig
if (args.len != 4) {
    try stdout.print("Usage: {s} <number> <operator> <number>\n", .{args[0]});
    return;
}
```

* Checks if exactly **three arguments** are provided (excluding the program name).
* If not, prints usage instructions and exits.

---

### 🔢 Parse Input Values

```zig
const number1 = try std.fmt.parseFloat(f64, args[1]);
const operator = args[2];
const number2 = try std.fmt.parseFloat(f64, args[3]);
```

* Parses the first and third arguments as `f64` (floating point numbers).
* Stores the operator as a string slice.

---

### ➕ Perform the Operation

```zig
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
```

* Uses a `switch` to determine which arithmetic operation to perform based on the first character of the `operator`.
* Supports: `+`, `-`, `*`, `/`, and `^` (power).
* Prints an error if the operator is invalid.

---

### 📤 Print the Result

```zig
try stdout.print("{d} {c} {d} = {d}\n", .{ number1, operator[0], number2, result });
```

* Displays the final computed result to the user.

---

### ✅ Example Usage

```bash
./calc 10 ^ 2
# Output: 10 ^ 2 = 100
```

---



