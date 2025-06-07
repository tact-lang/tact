struct SerialNested {
    a: Int as uint4;
    b: Int as int8;
}

contract SerialNestedUse {
    foo: SerialNested;

    init() {
        self.foo = SerialNested{a: 12, b: -7};
    }

    receive() {}
}