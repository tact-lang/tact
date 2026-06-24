contract TestBitwiseOperators {
    receive() {
         let a: Int = 0b1010;
         let b: Int = 0b1100;
         let c: Int = a & b; // expected result: 0b1000 (8)
         let d: Int = a | b; // expected result: 0b1110 (14)
         let e: Int = a ^ b; // expected result: 0b0110 (6)
         dump(c);
         dump(d);
         dump(e);
    }
}
