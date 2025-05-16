contract TestPrimitives {
    fun run() {
        let a: Int = 42;
        let b: Bool = true && false;
        let s: String = "Hello, Tact!";
        let c: Cell = beginCell().storeUint(5, 3).endCell();
        let addr: Address = myAddress();
        dump(a);
        dump(b);
        dump(s);
        dump(c);
        dump(addr);
    }
    receive() {}
}
