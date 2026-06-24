struct BoolDeep {
    b1: Bool;
    nest: BoolDeepNest;
}

struct BoolDeepNest {
    b2: Bool;
    b3: Bool;
}

struct OptionalLayer {
    n: BoolDeep?;
    s: String?;
}

contract OptAndBoolDeep {
    field: OptionalLayer;

    init() {
        self.field = OptionalLayer{
            n: BoolDeep{
                b1: true,
                nest: BoolDeepNest{
                    b2: false,
                    b3: true
                }
            },
            s: null
        };
    }
}