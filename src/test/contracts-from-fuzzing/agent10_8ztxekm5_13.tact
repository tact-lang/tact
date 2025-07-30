struct MyStruct {
    x: Int;
    y: Bool;
}

contract Test {
    receive() {
        let s: MyStruct = MyStruct{x: 1, y: true};
    }
}