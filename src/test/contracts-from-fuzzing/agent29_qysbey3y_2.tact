contract TestPrimitive() {
    fun run() {
        // Test assignment of primitive types
        let a: Int = 42;
        let b: Bool = true;
        let addr: Address = myAddress();
        let cellVal: Cell = emptyCell();
        
        dump(a);
        dump(b);
        dump(addr);
        dump(cellVal);
    }
    receive() { self.run(); }
}
