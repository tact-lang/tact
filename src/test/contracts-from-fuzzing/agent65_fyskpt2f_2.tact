contract TestArithmetic {
    receive() {}

    // Normal scenario: simple arithmetic addition
    fun add(x: Int, y: Int) : Int {
        return x + y;
    }

    // Boundary scenario: subtracting a larger number from a smaller number
    fun subtract(x: Int, y: Int) : Int {
        return x - y;
    }

    // Normal scenario: multiplication
    fun multiply(x: Int, y: Int) : Int {
        return x * y;
    }

    // Normal scenario: division, note: division by zero is not allowed
    fun divide(x: Int, y: Int) : Int {
        return x / y;
    }

    // Edge scenario: large integer arithmetic (boundary test)
    fun bigArithmetic(): Int {
        let a = 2147483647; // typical 32-bit max integer
        let b = a + 1; // potential overflow boundary - note Tact uses arbitrary precision ints
        return b;
    }

    // Edge scenario: negative arithmetic
    fun negativeArithmetic(x: Int) : Int {
        return -x;
    }

    // Invalid scenario: division by zero if it were to be executed, but we are only testing compilation
    // This function is wrapped in a contract call but never executed.
    fun invalidDivide() : Int {
        // We do a compile-time check: we won't call division by zero here; its behavior is run-time
        // Returning a constant to verify compile-time validity
        return 1;
    }
}
