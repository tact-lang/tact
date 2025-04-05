contract TestPrimitive() {
    fun run() {
        // Testing primitive types
        let a: Int = 1 + 1;                  // basic arithmetic
        let b: Bool = true && false;         // boolean operation
        let addr: Address = myAddress();       // get contract's address
        let cell: Cell = "hello".asComment();  // convert string to cell
        dump(a);
        dump(b);
        dump(addr);
        dump(cell);
    }
    
    receive() {
        self.run();
        cashback(sender());
    }
}

// Dummy contract to ensure all code is used
contract Dummy() {}