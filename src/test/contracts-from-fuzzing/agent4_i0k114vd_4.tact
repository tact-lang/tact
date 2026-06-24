struct MyPair {
    a: Int;
    b: Bool;
}

contract TestStruct {
    receive() {}

    get fun getStruct(): MyPair {
        return MyPair { a: 1, b: true };
    }
}
