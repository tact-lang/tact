struct BoolOptionalMix {
    a: Bool;
    b: Bool?;
    c: Bool;
    d: Bool?;
}

contract BoolOptMixTest {
    val: BoolOptionalMix;

    init() {
        self.val = BoolOptionalMix{
            a: true,
            b: null,
            c: false,
            d: true
        };
    }
}