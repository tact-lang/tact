contract TestBinaryExpressions {
    receive() {
        let a: Int = 10 + 5;
        let b: Int = 10 - 5;
        let c: Int = 10 * 5;
        let d: Int = 10 / 5; // integer division
        dump(a);
        dump(b);
        dump(c);
        dump(d);
    }
}
