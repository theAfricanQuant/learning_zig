🧪 Learning Zig Playground
Welcome to the Learning Zig Playground, a personal repository for experimenting with and learning the Zig programming language.

🚀 What Is This Repository?
This repository serves as a collection of small Zig projects, code snippets, and experiments. The primary goal is to deepen my understanding of Zig, including its unique features, memory management model, and low-level systems programming concepts.

🛠️ Development Environment
This project is developed within a Linux environment using the Windows Subsystem for Linux (WSL).

Host OS: Windows 10/11

WSL Distro: Ubuntu 20.04

Editor: Visual Studio Code (launched with code . from the WSL terminal)

Zig Version: Installed directly within WSL

Terminal: VS Code integrated terminal or a native WSL shell

This setup provides a Linux-native development experience while retaining the flexibility of the Windows operating system.

⚙️ How to Build and Run
You can compile and run the Zig programs from your terminal. For example, to build and run the calculator script:

# Compile the Zig source file into an executable
zig build-exe calc.zig

# Run the compiled program with arguments
./calc 10 + 5

If you are not on a WSL/Linux system or need to specify a target architecture, you can use the --target flag:

zig build-exe calc.zig --target native-native-gnu

📚 Topics Being Explored
This playground focuses on a variety of topics, including:

Core Zig syntax and language features

Manual memory management and allocators

Navigating and utilizing the standard library (std)

Building command-line interface (CLI) tools

Implementing common system-level programming patterns

Understanding memory safety in Zig

Note: This repository is for educational purposes only. The code is not production-grade and reflects an ongoing learning process.

Author: theAfricanQuant
