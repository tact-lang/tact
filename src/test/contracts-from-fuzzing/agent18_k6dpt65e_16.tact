struct MyStruct {
    a: Int;
    b: Bool;
}

contract Test {
    receive() {
        // Testing dump() with a struct converted to Cell using .toCell()
        dump(MyStruct{ a: 42, b: true }.toCell());
    }
}
