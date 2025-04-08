struct NestedSerialization {
    foo: Int as uint8;
    bar: Int as int16;
}

contract StructSerialization {
    val: NestedSerialization;

    init() {
        self.val = NestedSerialization{ foo:1, bar:-2 };
    }
}