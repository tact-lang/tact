struct Core { valCore: Int; }

struct MixedComplex {
    a: Int?;
    b: Bool?;
    core: Core;
    strOpt: String?;
}

contract NestedAndOptionalsMix {
    data: MixedComplex;

    init() {
        self.data = MixedComplex{
            a: null,
            b: null,
            core: Core{ valCore: 5 },
            strOpt: null,
        };
    }
}