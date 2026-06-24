// Test case 1: Valid Primitive Types
contract TestPrimitive {
    fun test() {
        let a: Int = 1 + 1;
        let b: Bool = true && false;
        let s: String = "hello";
        let addr: Address = myAddress();
        let cell_val: Cell = emptyCell();
        dump(a);
        dump(b);
        dump(s);
    }
    receive() {}
}
