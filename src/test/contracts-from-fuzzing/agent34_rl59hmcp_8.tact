struct One { number: Int; }

fun testStruct() {
    let val: One = One{ number: 50 };
    let cell: Cell = val.toCell();
    let recovered: One = One.fromCell(cell);
    dump(recovered.number); // expected output: 50
}

contract TestStruct {
    receive() {
        testStruct();
    }
}
