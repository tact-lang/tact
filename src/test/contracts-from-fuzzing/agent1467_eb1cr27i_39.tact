struct NestedSerialize {
    int8Val: Int as int8;
    int16Val: Int as int16;
    uint8Val: Int as uint8;
    uint16Val: Int as uint16;
}

struct MiddleSerialize {
    nested: NestedSerialize;
    boolVal: Bool;
}

contract SerializeComplex {
    data: MiddleSerialize;
    init() {
        self.data = MiddleSerialize{
            nested: NestedSerialize{
                int8Val: -128,
                int16Val: -32768,
                uint8Val: 255,
                uint16Val: 65535
            },
            boolVal: true
        };
    }
}