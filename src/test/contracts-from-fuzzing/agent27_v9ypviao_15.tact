contract TestArithmeticPrecedence2 {
    receive() {
         // Test combining addition, multiplication, and bitwise shift operators:
         // According to precedence: multiplication before addition, then bitwise shifts (which have lower precedence than addition).
         // So 3 * 2 = 6, then 5 + 6 = 11, then 11 << 1 = 22.
         let a: Int = 5 + 3 * 2 << 1;
         dump(a); // expected output: 22
    }
}
