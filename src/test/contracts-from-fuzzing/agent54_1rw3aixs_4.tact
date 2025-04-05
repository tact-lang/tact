struct MyStruct {
    a: Int;
    b: Bool;
}

contract Test {
    receive() {
        let s: MyStruct = MyStruct { a: 10, b: true };
    }
}