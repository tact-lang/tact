struct MyStruct {
    x: Int;
    y: Int;
}

contract Test {
    receive() {
        let s: MyStruct = MyStruct { x: 1, y: 2 };
    }
}