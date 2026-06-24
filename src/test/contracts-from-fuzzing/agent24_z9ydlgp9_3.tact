struct MyStruct {
    a: Int;
    b: Bool;
}

contract TestStructGetter {
    ms: MyStruct = MyStruct { a: 10, b: true };

    receive() {}

    get fun getStruct(): MyStruct {
        return self.ms;
    }
}
