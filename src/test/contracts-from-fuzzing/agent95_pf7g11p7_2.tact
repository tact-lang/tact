contract PrimitiveTest {
    // Testing Int literals and arithmetic operations
    fun test() {
        let a: Int = 1 + 2;           // expect 3
        let b: Int = 0b1010;          // expect 10
        let c: Int = 0o12;            // expect 10
        let d: Int = 0xA;             // expect 10
        dump(a);
        dump(b);
        dump(c);
        dump(d);
    }

    receive() {
        self.test();
    }
}
