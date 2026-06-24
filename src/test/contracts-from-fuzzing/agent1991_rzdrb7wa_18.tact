struct MixedSerialization {
    a: Int as uint8;
    b: Int as int64;
    c: Int;
}

struct NestedMix {
    first: MixedSerialization;
    second: MixedSerialization;
}

contract SerializationDeep {
    val: NestedMix;

    init() {
        self.val = NestedMix{
            first: MixedSerialization{ a:1, b:2, c:3 },
            second: MixedSerialization{ a:4, b:5, c:6 }
        };
    }
}