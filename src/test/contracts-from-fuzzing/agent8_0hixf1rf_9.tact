struct MyStruct {
    a: Int;
    b: Bool;
}

contract Test {
    receive() {
        let x = MyStruct{a: 5, b: true};
        let y = x.a + 1;
    }
}