struct MyStruct {
    a: Int;
    b: Bool;
}

contract Test3 {
    myValue: MyStruct;

    init() {
        self.myValue = MyStruct{ a: 10, b: true };
    }

    get fun getStruct(): MyStruct {
        return self.myValue;
    }

    receive() {}
}
