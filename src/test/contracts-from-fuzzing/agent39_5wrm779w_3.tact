// Test: Primitive Types Valid Usage
// This test validates that basic primitive types (Int, Bool, String, Cell & Slice) behave as documented.

contract TestPrimitives {
    fun test() {
        let a: Int = 42;
        let b: Bool = true;
        let s: String = "hello";
        let c: Cell = emptyCell();
        let sl: Slice = c.asSlice();
        dump(a);
        dump(b);
        dump(s);
        dump(sl.bits());
    }
    receive() { self.test(); }
}
