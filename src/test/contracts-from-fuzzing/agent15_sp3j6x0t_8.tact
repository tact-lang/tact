struct MyStruct {
    a: Int;
}

contract DebugTestStructToCell {
    // Test dump() with a struct value converted to cell
    receive() {
        let ms: MyStruct = MyStruct{ a: 42 };
        dump(ms.toCell());
    }
}
