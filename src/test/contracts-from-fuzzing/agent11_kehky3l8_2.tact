contract TestPrimitiveTypes() {
    fun test() {
        let a: Int = 1 + 1;
        let b: Int = ton("1");
        let s: String = "Test";
        let c: Cell = emptyCell();
        let addr: Address = myAddress();
        dump(a);
        dump(b);
        dump(s);
        dump(c);
        dump(addr);
    }

    receive() { self.test(); }
}
