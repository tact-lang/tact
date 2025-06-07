contract Test {
    receive() {
        // Ternary operator tests:
        // 1. Basic ternary:
        dump(true ? 100 : 200); // Expected: 100
        
        // 2. Nested alternative ternary without extra parentheses:
        // According to documentation, false ? 1 : false ? 2 : 3 should evaluate to 3
        dump(false ? 1 : false ? 2 : 3);   // Expected: 3
        
        // 3. Nested consequence requires parentheses:
        dump(false ? (false ? 10 : 20) : 30); // Expected: 30
        
        // 4. Simple condition returning one of two values:
        dump((2 > 1) ? 42 : -42); // Expected: 42
    }
}
