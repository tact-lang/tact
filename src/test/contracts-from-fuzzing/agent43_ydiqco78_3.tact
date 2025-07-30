struct MyStruct { a: Int; b: Bool; }

contract Test {
    s: MyStruct = MyStruct { a: 42, b: true };

    // Getter returning the struct value
    get fun getS(): MyStruct {
        return self.s;
    }

    receive() {}
}
