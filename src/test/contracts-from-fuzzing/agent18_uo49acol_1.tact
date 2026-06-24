contract TestPrimitives() {
    fun showcase() {
        let a: Int = 10 + 5;
        let b: Bool = true && false;
        let s: String = "Test";
        let cellTest: Cell = "hello".asComment();
        let addr: Address = myAddress();
        dump(a);
        dump(b);
        dump(s);
        dump(cellTest);
        dump(addr);
    }
}
