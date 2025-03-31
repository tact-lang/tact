contract Test {
    receive() {}

    // Testing basic addition operation for Int types as documented
    get fun add(a: Int, b: Int): Int {
        return a + b;
    }

    // Also test a boundary scenario with subtraction
    get fun sub(a: Int, b: Int): Int {
        return a - b;
    }

    // Test multiplication
    get fun mul(a: Int, b: Int): Int {
        return a * b;
    }

    // Test division - assuming normal division without division by 0
    get fun div(a: Int, b: Int): Int {
        return a / b;
    }
}
