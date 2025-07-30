struct MyStruct {
    a: Int;
    b: Bool;
}

contract StructTest {
    s: MyStruct = MyStruct { a: 10, b: true };

    receive() {}

    get fun getStruct(): MyStruct {
        return self.s;
    }
}
