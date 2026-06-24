contract TestPrecedence {
    receive() {
         let a: Int = 5 * (5 - 2); // should be 15
         let b: Int = 5 * 5 - 2;   // should be 23
    }
}
