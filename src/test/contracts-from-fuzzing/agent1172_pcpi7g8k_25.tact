struct NestedMix {
    i: Int;
    o: Bool?;
    s: InnerMix;
}

struct InnerMix {
    x: Int?;
    y: String;
    z: Bool?;
}

contract NestedMixedTest {
    m: NestedMix;

    init() {
        self.m = NestedMix{
            i: 55,
            o: null,
            s: InnerMix{
                x: null,
                y: "hey",
                z: true
            }
        };
    }
}