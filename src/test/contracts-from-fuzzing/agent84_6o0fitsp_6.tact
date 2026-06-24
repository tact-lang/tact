/// TestStruct: Validate struct instantiation and conversion to/from Cell
struct One { number: Int; }

contract TestStruct {
    fun test() {
        let o: One = One{ number: 100 };
        let cell: Cell = o.toCell();
        let o2: One = One.fromCell(cell);
        dump(o2.number); // Expected output: 100
    }
    receive() {}
}
