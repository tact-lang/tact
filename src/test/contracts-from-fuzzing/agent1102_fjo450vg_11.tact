struct NestedSerialization {
    a: Int as int8;
    b: Int as uint120;
    optC: Int?;
}

contract ComplexSerialization {
    field: NestedSerialization;

    init() {
        self.field = NestedSerialization{
            a: -5,
            b: 123456789012345678901234567890,
            optC: null
        };
    }
}
