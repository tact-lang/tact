struct MyStruct {
    a: Int;
    b: Bool;
}

contract GetterStruct {
    s: MyStruct = MyStruct { a: 10, b: true };

    receive() {}

    get fun getS(): MyStruct {
        return self.s;
    }
}
