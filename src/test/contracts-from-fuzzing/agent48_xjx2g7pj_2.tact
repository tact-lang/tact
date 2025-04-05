contract TestPrimitive() {
    fun run() {
        // Testing primitives
        let x: Int = 1 + 2;
        let b: Bool = true && false;
        let s: String = "Hello, Tact!";
        let c: Cell = s.asComment();
        let addr: Address = myAddress();
        // Dump values to confirm runtime behavior
        dump(x);     // Expected: 3
        dump(b);     // Expected: false
        dump(s);     // Expected: "Hello, Tact!"
        dump(addr);  // Expected: current contract's address
    }

    // The receive function ensures the contract is actually executed.
    receive() {
        self.run();
    }
}
