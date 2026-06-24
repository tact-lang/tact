contract TestAdvancedExpressions {
    receive() {
        // Integer literal with underscores
        let a: Int = 1_000_000;
        // Hexadecimal and octal addition: 0xFF (255) + 0o7 (7) = 262
        let b: Int = 0xFF + 0o7;
        // Logical expressions with short-circuit operators
        let c: Bool = true && (false || true);
        // Chain calls: converting a string literal to a comment cell
        let s: Cell = "Advanced Test".asComment();
        // Mixed arithmetic expression: division, multiplication and bitwise shift
        // (a / 10) - (b * 2) + (3 << 1)
        let d: Int = ((a / 10) - (b * 2)) + (3 << 1);

        dump(a); // Expect: 1000000
        dump(b); // Expect: 262
        dump(c); // Expect: true
        dump(d); // Expect calculation: (1_000_000/10)=100000, then 100000 -524 + 6 = 99482
        dump(s); // Expect: a cell representing "Advanced Test" with comment formatting
    }
}
