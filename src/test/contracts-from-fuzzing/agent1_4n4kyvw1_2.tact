struct MyStruct {
    a: Int;
    b: Bool;
}

contract Test {
    receive() {
        let s = MyStruct{a: 5, b: true};
    }
}