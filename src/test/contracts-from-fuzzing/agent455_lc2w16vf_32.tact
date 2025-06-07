struct SBoolLayer {
    a: Bool;
    b: InnerBool;
}

struct InnerBool {
    c: Bool?;
    d: Bool;
}

contract BoolLayerTest {
    v: SBoolLayer;

    init() {
        self.v = SBoolLayer{
            a: false,
            b: InnerBool{
                c: null,
                d: true,
            }
        };
    }
}