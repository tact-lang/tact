contract TestComparisonAndBitwise {
    receive() {
         let eq: Bool = 10 == 10;
         let neq: Bool = 10 != 11;
         let gt: Bool = 10 > 5;
         let lt: Bool = 5 < 10;
         let ge: Bool = 10 >= 10;
         let le: Bool = 10 <= 11;
         
         let andResult: Int = 6 & 3;
         let orResult: Int = 6 | 3;
         let xorResult: Int = 6 ^ 3;
         
         let shiftLeft: Int = 1 << 3;
         let shiftRight: Int = 8 >> 2;
    }
}
