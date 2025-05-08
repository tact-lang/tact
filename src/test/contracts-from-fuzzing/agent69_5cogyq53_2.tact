contract TestPrimitive() {
    fun test() {
        // Test primitive types
        let x: Int = 1 + 1;              // Testing Int arithmetic
        let b: Bool = true && false;       // Testing Bool
        let s: String = "Hello, Tact!";    // Testing String literal
        let c: Cell = emptyCell();         // Testing Cell creation
        let a: Address = myAddress();      // Testing Address
        // Using String extension function
        let _ = s.asComment();             
    }

    receive() {
        self.test();
        cashback(sender());
    }
}
