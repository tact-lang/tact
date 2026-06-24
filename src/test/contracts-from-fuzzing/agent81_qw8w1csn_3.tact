struct MyStruct {
    a: Int;
    b: Bool;
}

contract Test2 {
    a: Int = 10;
    b: Bool = true;

    receive() {}

    get fun getStruct(): MyStruct {
        return MyStruct{a: self.a, b: self.b};
    }
}
