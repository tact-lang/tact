struct MyStruct {
    a: Int;
    b: Bool;
}

contract Test {
    get fun getStruct() : MyStruct {
        return MyStruct{a: 1, b: true};
    }

    receive() {}
}
