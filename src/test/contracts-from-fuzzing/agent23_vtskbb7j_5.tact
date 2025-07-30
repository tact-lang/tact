contract TestArithmetic {
    receive() {
         let a = 10 + 2 * 3;         // expects 16
         let b = (10 + 2) * 3;        // expects 36
         let c = 8 / 4;             // expects 2
         let d = 8 % 3;             // expects 2
    }
}
