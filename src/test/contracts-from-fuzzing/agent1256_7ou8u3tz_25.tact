struct InnerNest {
    val: String;
}

struct UpperCombo {
    nested: InnerNest;
    optFlag: Bool?;
}

contract AssignNullAndNested {
    storage: UpperCombo;

    init() {
        self.storage = UpperCombo{
            nested: InnerNest{ val: "inner" },
            optFlag: null
        };
    }
}