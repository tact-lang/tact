contract TestBool() {
    fun test() {
        // Testing Boolean operations
        let a: Bool = true && false;      // expected false
        let b: Bool = true || false;        // expected true
        dump(a); // should output false (0)
        dump(b); // should output true (1)
    }
    receive() { self.test(); }
}
