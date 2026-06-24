contract TestPrimitive {
    fun run() {
        // Testing various primitive types
        let i: Int = 42;
        let b: Bool = true;
        let s: String = "test";
        let c: Cell = s.asComment();
        let addr: Address = myAddress();
        // Different numeral bases
        let hex: Int = 0xFF;
        let bin: Int = 0b1010;
        let oct: Int = 0o77;
        dump(i + hex + bin + oct);
    }
    receive() {
        self.run();
        cashback(sender());
    }
}
