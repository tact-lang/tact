contract TestTernary {
    receive() {
        // Ternary operator tests
        // using explicit parentheses for clarity
        dump(false ? 1 : (false ? 2 : 3)); // expecting 3
        // without parentheses, right-associativity applies to the alternative part
        dump(false ? 1 : false ? 2 : 3);   // according to docs, expecting 3
        dump(true  ? (false ? 1 : 2) : 3);   // expecting 2
    }
}
