struct NestedMix {
    outerVal: Int;
    nest: InnerMix;
}

struct InnerMix {
    a: Int = 5;
    b: Bool;
    c: String?;
}

contract NestedMixDefaults {
    state: NestedMix;
    init() {
        self.state = NestedMix{
            outerVal: 1,
            nest: InnerMix{
                b: true,
                c: null
            }
        };
    }
}