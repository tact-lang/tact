contract TestPrimitives {
    fun test() {
        let a: Int = 1 + 2;
        let b: Bool = true && false;
        let s: String = "Hello, Tact";
        let c: Cell = emptyCell();
        dump(a);
        dump(b);
        dump(s);
        dump(c);
    }
    receive() { self.test(); }
}
