contract TestPrimitive {
    fun test() {
        let a: Int = 1 + 1;
        let b: Bool = true && false;
        let s: String = "hello";
        let c: Cell = emptyCell();
        let addr: Address = myAddress();
        dump(a);
        dump(b);
        dump(s);
        dump(c);
        dump(addr);
    }

    // Ensure the function is used so it's not optimized out
    receive() { self.test(); }
}
