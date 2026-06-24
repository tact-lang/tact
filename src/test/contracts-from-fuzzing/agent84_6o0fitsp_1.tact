contract TestPrimitiveTypes {
    fun test() {
        let i: Int = 42;
        let b: Bool = true;
        let s: String = "hello";
        let c: Cell = emptyCell();
        let a: Address = myAddress();
        dump(i);
        dump(b);
        dump(s);
    }
    receive() {}
}
