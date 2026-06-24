struct MyStruct {
    a: Int;
    b: Bool;
}

contract TestGetterStruct {
    s: MyStruct;

    init() {
        self.s = MyStruct { a: 7, b: true };
    }

    receive() {}

    get fun getS(): MyStruct {
        return self.s;
    }
}
