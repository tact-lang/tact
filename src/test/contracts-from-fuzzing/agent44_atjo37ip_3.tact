struct MyStruct {
    a: Int;
    b: Bool;
}

contract Test3 {
    s: MyStruct = MyStruct{a: 10, b: false};

    receive() {}

    get fun getStruct(): MyStruct {
        return self.s;
    }
}
