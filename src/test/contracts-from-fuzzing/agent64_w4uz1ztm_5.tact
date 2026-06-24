struct MyStruct {
    a: Int;
    b: Int;
}

contract Test {
    receive() {
        let s = MyStruct { a: 1, b: 2 };
    }
}