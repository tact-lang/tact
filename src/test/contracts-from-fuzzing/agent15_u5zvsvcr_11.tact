contract TestBinaryOps {
    receive() {
         // Test binary arithmetic operators
         let a: Int = 10 - 5;
         let b: Int = 4 * 3;
         let c: Int = 20 / 4;
         let d: Int = 20 % 3;
         // Test operator precedence with parentheses
         let e: Int = 5 * (3 + 2) - 4;
    }
}
