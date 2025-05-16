contract TestPrimitive {
    fun run() {
        let a: Int = 1 + 2;
        let b: Bool = true && false;
        let c: String = "hello";
        let d: Cell = emptyCell();
        let e: Address = myAddress();
    }
    receive() {}
}
