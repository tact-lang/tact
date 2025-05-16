contract Test {
    receive() {}

    fun add(x: Int, y: Int) : Int {
        return x + y;
    }

    fun subtract(x: Int, y: Int) : Int {
        return x - y;
    }

    fun multiply(x: Int, y: Int) : Int {
        return x * y;
    }

    fun divide(x: Int, y: Int) : Int {
        return x / y;
    }

    // Boundary test: large number arithmetic
    fun bigArithmetic(): Int {
        let a = 2147483647; // max 32-bit integer
        let b = a + 1; // potential overflow boundary
        return b;
    }
}
