struct DeepOptMix {
    a: Int? as uint8;
    b: Bool?;
    c: String?;
}

struct OuterOptMix {
    inner: DeepOptMix?;
    id: Int;
}

contract NestedOptMixOuter {
    field: OuterOptMix;

    init() {
        self.field = OuterOptMix{
            inner: null,
            id: 99
        };
    }
}