struct InnerMost {
    value: Int;
}

struct MidLevelOptional {
    nested: InnerMost?;
    flag: Bool;
}

struct TopLevel {
    mid: MidLevelOptional;
    label: String;
}

contract DeepOptionalCombo {
    data: TopLevel;
    
    init() {
        self.data = TopLevel {
            mid: MidLevelOptional { nested: null, flag: true },
            label: "test"
        };
    }
}