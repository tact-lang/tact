struct MixNestedOpt {
    v1: Int?;
    nest: SubMix?;
}

struct SubMix {
    i: Int;
    s: String;
    b: Bool?;
}

contract TestMixNestedOpt {
    s: MixNestedOpt;
    init() {
        self.s = MixNestedOpt{
            v1: null,
            nest: SubMix{
                i:5, s:"s", b:null
            }
        };
    }
}
