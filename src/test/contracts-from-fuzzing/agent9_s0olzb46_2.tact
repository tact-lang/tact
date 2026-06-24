contract TestPrimitives() {
    fun test() {
        let a: Int = 42;
        let b: Bool = true;
        let s: String = "Hello";
        let addr: Address = myAddress();
        let c: Cell = emptyCell();
        let sl: Slice = c.asSlice();
        dump(a);
        dump(b);
        dump(s);
        dump(addr);
    }
    receive() { self.test(); }
}
