contract TestArithmetic {
    receive() {
         // Testing binary arithmetic expressions
         let add: Int = 10 + 20;    // expected 30
         let sub: Int = 30 - 5;     // expected 25
         let mul: Int = 2 * 3;      // expected 6
         let div: Int = 10 / 3;     // integer division, expected 3
         dump(add);
         dump(sub);
         dump(mul);
         dump(div);
    }
}
