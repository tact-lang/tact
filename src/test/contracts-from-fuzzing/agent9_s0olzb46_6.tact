// TestStructs: Testing struct usage

struct One { number: Int; }

contract TestStructs() {
    fun test() {
        let one: One = One { number: 50 };
        dump(one.number); // should dump 50
        let cell: Cell = one.toCell();
        let one2: One = One.fromCell(cell);
        dump(one2.number); // should also dump 50
    }
    receive() { self.test(); }
}
