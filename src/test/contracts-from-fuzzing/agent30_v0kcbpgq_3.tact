contract TestPrimitive() {
    fun run() {
        let a: Int = 42;
        let b: Int = 0xFF;
        let c: Bool = true && false;
        let s: String = "hello, world!";
        let e: Cell = emptyCell();
        dump(a);
        dump(b);
        dump(c);
        dump(s);
        dump(e);
    }
    receive() {
        self.run();
    }
}
