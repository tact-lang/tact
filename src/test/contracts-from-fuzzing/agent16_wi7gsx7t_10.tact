struct ConstValues {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
}

contract TestConstantExpressions() {
    // Constant expressions evaluated at compile time
    // a = 1 + 2*3 - (4/2) = 1 + 6 - 2 = 5
    const a: Int = 1 + 2 * 3 - (4 / 2);
    // b = false ? 1 : 2 = 2
    const b: Int = false ? 1 : 2;
    // c = -(~5); In operators doc, ~5 = -6, so -(~5) = 6
    const c: Int = -(~5);
    // d = 1 % -5; as documented, it should evaluate to -4
    const d: Int = 1 % -5;
    // e = 1730 + (8 | 8); bitwise OR of 8 and 8 is 8, so 1730+8 = 1738
    const e: Int = 1730 + (8 | 8);

    // Getter exposes the constant values
    get fun getConstants() : ConstValues {
         return ConstValues{ a: self.a, b: self.b, c: self.c, d: self.d, e: self.e };
    }

    receive() {
         cashback(sender());
    }
}
