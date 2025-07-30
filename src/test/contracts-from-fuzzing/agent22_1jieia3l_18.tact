contract TestInlineAssignment {
    receive() {
         // Inline conditional expression used in arithmetic
         let x: Int = (true ? 10 : 20) + 5;  // Expected: 15 if condition true
    }
}
