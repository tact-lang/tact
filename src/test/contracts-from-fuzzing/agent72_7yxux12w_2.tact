contract TestTypes {
    fun testPrimitive() {
        let i: Int = 123;
        let b: Bool = false;
        let s: String = "abc";
        let a: Address = myAddress();
        let c: Cell = emptyCell();
    }

    receive() { self.testPrimitive(); }
}
