contract TestPrimitiveAndOptionals() {
    fun test_primitive() {
        let a: Int = 1 + 1; // expected 2
        dump(a);
        let b: Bool = true && false; // expected false
        dump(b);
        let s: String = "Hello, Tact!";
        dump(s);
    }
    fun test_optional() {
        let opt: Int? = null;
        opt = 255;
        dump(opt!!); // expected 255
    }
    receive() {
        self.test_primitive();
        self.test_optional();
        return;
    }
}
