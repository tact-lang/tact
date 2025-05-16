struct MyStruct {
    a: Int;
    b: Bool;
}

contract TestOptionalGetter {
    data: MyStruct;

    init() {
        self.data = MyStruct{ a: 123, b: false };
    }

    receive() {}

    get fun getOptional(): MyStruct? {
        return null;
    }
}
