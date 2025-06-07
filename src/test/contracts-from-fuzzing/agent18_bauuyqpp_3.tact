contract TestTernaryOperator {
    fun showcase() {
        // Ternary operator associativity test
        // According to the documentation: false ? 1 : true ? 2 : 3 should evaluate to 2
        dump(false ? 1 : true ? 2 : 3);
    }
}
