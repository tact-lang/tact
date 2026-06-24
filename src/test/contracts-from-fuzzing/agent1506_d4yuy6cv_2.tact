struct DeepNested {
    n: NestedOpt;
}

struct NestedOpt {
    innerOpt: Int?;
}

contract Test {
    field: DeepNested;

    init() {
        self.field = DeepNested{ n: NestedOpt{ innerOpt: 42 } };
    }
}

// Test with deeper nested optional fields inside persistent storage