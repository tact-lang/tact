struct InnerMost {
    leaf: Int;
}

struct NestedMid {
    mid: InnerMost;
    flag: Bool;
}

struct Top {
    data: NestedMid;
    optionalVal: Int?;
}

contract DeepNestedCombo {
    state: Top;

    init() {
        self.state = Top{
            data: NestedMid{ mid: InnerMost{ leaf: 99 }, flag: false },
            optionalVal: null
        };
    }
}
