contract PrimitiveTest {
    fun test() {
        // Integer, Boolean, Address, Cell, String
        let a: Int = 1 + 1;                // 2
        let b: Bool = true && false;         // false
        let c: Address = myAddress();        // current contract address
        let d: Cell = emptyCell();           // empty cell
        let e: String = "Hello";           
        a; b; c; d; e; // use values to avoid unused variable warnings
    }
    
    receive() {
        self.test();
    }
}
