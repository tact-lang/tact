struct MyStruct {
    x: Int;
    y: Int;
}

contract Test {
    receive() {
        let a: MyStruct = MyStruct{x: 1, y: 2};
    }
}