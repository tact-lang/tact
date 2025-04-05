struct One { number: Int; }

fun testStruct() {
    // Create an instance of the struct and dump its number field
    let o: One = One{ number: 42 };
    dump(o.number); // Expected output: 42
    
    // Convert the struct to a Cell and back, then dump the number field
    let cellRepresentation: Cell = o.toCell();
    let o2: One = One.fromCell(cellRepresentation);
    dump(o2.number); // Expected output: 42
}

contract TestStructs() {
    fun test() {
        testStruct();
    }

    receive() {
        self.test();
    }
}
