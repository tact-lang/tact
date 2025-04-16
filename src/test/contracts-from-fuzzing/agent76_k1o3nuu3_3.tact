struct MyStruct {
    a: Int;
    b: Bool;
}

contract Test {
    value: MyStruct;

    init() {
        self.value = MyStruct{ a: 10, b: true };
    }

    receive () {}

    get fun getMyStruct(): MyStruct {
        return self.value;
    }
}
