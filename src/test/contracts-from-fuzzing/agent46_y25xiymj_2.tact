contract Test {
    receive() {}

    fun subtractTest(): Int {
        // Testing operator associativity for subtraction: should associate to the left
        // Expected: (1 - 2) - 3 = -4
        let a = 1 - 2 - 3;
        return a;
    }
}
