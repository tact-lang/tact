struct MyStruct {
    a: Int;
    b: Bool;
}

contract Test {
    s: MyStruct = MyStruct{ a: 1, b: true };

    receive() {}

    get fun get_struct(): MyStruct {
        return self.s;
    }
}
