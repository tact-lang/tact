struct VeryDeeplyNested {
    nested: Int;
}

struct MidStruct {
    a: VeryDeeplyNested;
    optDeep: VeryDeeplyNested?;
}

struct OuterStruct {
    b: MidStruct;
    optMid: MidStruct?;
}

contract ContractStructMix {
    top: OuterStruct;
    optOuter: OuterStruct?;
    directDeep: VeryDeeplyNested;

    init() {
        self.top = OuterStruct{
            b: MidStruct{ a: VeryDeeplyNested{nested:1}, optDeep:null },
            optMid: null
        };
        self.optOuter = null;
        self.directDeep = VeryDeeplyNested{nested:42};
    }
}
