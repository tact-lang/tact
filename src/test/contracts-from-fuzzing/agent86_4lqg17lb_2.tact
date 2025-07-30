contract TestPrimitives() {
    fun testPrimitives() {
        // Testing primitive types
        let a: Int = 42;
        let b: Bool = true;
        let s: String = "hello";
        let adr: Address = myAddress();
        let c: Cell = emptyCell();
        dump(a);
        dump(b);
        dump(s);
        dump(adr);
        dump(c);
    }
    receive() { self.testPrimitives(); }
}
