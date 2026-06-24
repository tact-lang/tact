// Mixed nested and flat optional and required fields
struct MixNest {
    req1: Int;
    opt1: Bool?;
    nested: NestedMix?;
}

struct NestedMix {
    flag: Bool;
    opt2: Int?;
}

contract TestContract {
    data: MixNest;
    
    init() {
        self.data = MixNest{
            req1: 5,
            opt1: true,
            nested: NestedMix{
                flag: true,
                opt2: null,
            },
        };
    }
}