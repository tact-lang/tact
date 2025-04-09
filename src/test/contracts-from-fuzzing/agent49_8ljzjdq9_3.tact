struct MyStruct {
    a: Int;
    b: Bool;
}

contract Test {
    receive() {}

    get fun getStruct(): MyStruct {
        return MyStruct { a: 10, b: false };
    }
}
