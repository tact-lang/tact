struct SerializeNested {
    x: Int as int64;
    y: Int as uint64;
}

contract NestedSerializeFields {
    a: SerializeNested;
    b: Int as int32;

    init() {
        self.a = SerializeNested{x: -42, y: 42};
        self.b = -1000;
    }
}
