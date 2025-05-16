struct MyStruct {
    a: Int;
    b: Bool;
}

contract TestStructGetter {
    s: MyStruct;

    init() {
        self.s = MyStruct{ a: 10, b: true };
    }

    receive() {}

    get fun getStruct(): MyStruct {
        return self.s;
    }
}
