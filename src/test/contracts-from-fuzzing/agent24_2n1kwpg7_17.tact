contract TestNestedExpressions {
    receive() {
        // Nested expressions including ternary, binary addition, and multiplication
        let x: Int = (true ? (2 + 2) : 5) * 3; // expected: (2+2)*3 = 12
    }
}
