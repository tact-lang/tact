contract TestUnaryBinaryOperators {
    fun negate(a: Int): Int { return -a; }
    receive() {
        let a: Int = -42;             // unary minus
        let b: Bool = !false;         // unary not
        let c: Int = 10 + 5;          // addition
        let d: Int = 20 - 3;          // subtraction
        let e: Int = 4 * 3;           // multiplication
        let f: Int = 20 / 4;          // division
        let g: Bool = (10 > 5) && (2 < 3); // combined logical operations
        // Correct function call using self
        dump(self.negate(a));          
        dump(b);
        dump(c);
        dump(d);
        dump(e);
        dump(f);
        dump(g);
    }
}
