struct NestedWithSerialization {
    value: Int as uint32;
    optValue: Int?;
}

contract SerializationStructField {
    s: NestedWithSerialization;

    init() {
        self.s = NestedWithSerialization{
            value: 123456,
            optValue: null
        };
    }
}
