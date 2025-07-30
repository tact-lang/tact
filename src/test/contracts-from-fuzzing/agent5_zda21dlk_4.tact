struct MyStruct {
    a: Int;
    b: Bool;
}

contract Test {
    m: MyStruct = MyStruct { a: 123, b: true };

    receive() {}

    get fun get_m(): MyStruct {
        return self.m;
    }
}
