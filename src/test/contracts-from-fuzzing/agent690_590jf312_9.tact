struct MixOpt {
    requiredField: Int;
    optionalField: Bool?;
    nested: NestedStruct?;
}

struct NestedStruct {
    deepVal: String;
}

contract OptMix {
    data: MixOpt;

    init() {
        self.data = MixOpt{
            requiredField: 5,
            optionalField: null,
            nested: null
        };
    }
}