struct MyStruct {
    a: Int;
    b: Bool;
}

contract Test {
    s: MyStruct = MyStruct { a: 10, b: true };

    receive() {}

    // Getter function returning a struct
    get fun getStruct(): MyStruct {
        return self.s;
    }
}
