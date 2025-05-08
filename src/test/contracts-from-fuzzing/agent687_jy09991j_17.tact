struct NestedMix {
    inner1: MixIn;
    inner2: MixIn?;
}

struct MixIn {
    foo: Int;
    bar: Bool?;
}

contract NestedMixTest {
    val: NestedMix;

    init() {
        self.val = NestedMix{
            inner1: MixIn{ foo: 5, bar: null },
            inner2: null
        };
    }
}