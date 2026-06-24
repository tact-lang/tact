struct NestedMixOpt {
    foo: Int?;
    bar: Bool?;
}

struct MixOptOuter {
    f1: NestedMixOpt;
    f2: NestedMixOpt;
    f3: String?;
}

contract NestedOptionalCombo {
    val: MixOptOuter;

    init() {
        self.val = MixOptOuter{
            f1: NestedMixOpt{foo:null,bar:true},
            f2: NestedMixOpt{foo:1,bar:null},
            f3: null
        };
    }
}