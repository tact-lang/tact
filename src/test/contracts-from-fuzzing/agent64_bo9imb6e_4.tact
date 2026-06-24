struct MyStruct {
    a: Int;
    b: Bool;
}

contract TestStruct {
    a: Int = 10;
    b: Bool = true;

    receive() {}

    get fun getStruct(): MyStruct {
        return MyStruct{ a: self.a, b: self.b };
    }
}
