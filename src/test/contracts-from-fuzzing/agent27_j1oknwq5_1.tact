/// Test snippet for Primitive Types
contract TestPrimitive() {
    fun main() {
        // Testing Int, Bool, String, and Address
        let a: Int = 1 + 1;          // Expected: 2
        let b: Bool = true && false; // Expected: false
        let s: String = "hello";     
        let addr: Address = myAddress();
        // Convert string to Cell for message body usage
        let cellVal: Cell = s.asComment();
        dump(a);
        dump(b);
        dump(s);
        dump(addr);
        dump(cellVal);
    }
    
    // Minimal receiver to allow contract compilation
    receive() { return; }
}
