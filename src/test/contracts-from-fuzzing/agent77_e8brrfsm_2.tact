contract TestPrimitive() {
    fun test() {
        let a: Int = 42;
        let b: Bool = true;
        let s: String = "hello";
        let c: Cell = emptyCell();
        let addr: Address = myAddress();
        dump(a);
        dump(b);
        dump(s);
        dump(c);
        dump(addr);
    }
    receive() {
        self.test();
    }
}
