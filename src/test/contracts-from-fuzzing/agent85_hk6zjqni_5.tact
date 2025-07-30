struct MyStruct {
    a: Int;
    b: Bool;
}

contract TestStructGetter {
    data: MyStruct;

    init() {
        self.data = MyStruct{ a: 42, b: true };
    }

    receive() {}

    get fun getData() : MyStruct {
        return self.data;
    }
}
