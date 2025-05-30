contract TestTernary {
    receive() {
        // Test the ternary operator with nested associativity
        // According to documentation: false ? 1 : (false ? 2 : 3) should evaluate to 3
        dump(false ? 1 : (false ? 2 : 3));
    }
}
