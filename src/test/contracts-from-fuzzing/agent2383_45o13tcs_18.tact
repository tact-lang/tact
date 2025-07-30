struct DeepOptionalStruct {
    lvl1: OptionalMid?;
}

struct OptionalMid {
    lvl2: OptionalInner?;
}

struct OptionalInner {
    value: Int;
}

contract OptionalDeep {
    nestedOpt: DeepOptionalStruct;
    init() {
        self.nestedOpt = DeepOptionalStruct {
            lvl1: OptionalMid {
                lvl2: OptionalInner { value: 123 }
            }
        };
    }
}