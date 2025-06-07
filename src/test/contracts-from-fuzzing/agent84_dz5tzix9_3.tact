struct MyStruct {
    a: Int;
    b: Bool;
}

contract Test3 {
    s: MyStruct = MyStruct{ a: 1, b: true };

    receive() {}

    get fun getStruct(): MyStruct {
        return self.s;
    }
}
