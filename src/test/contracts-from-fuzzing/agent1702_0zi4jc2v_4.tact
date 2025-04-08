struct OptionNest {
    flag: Bool?;
    count: Int?;
    text: String?;
    nested: NestedStruct?;
}

struct NestedStruct {
    value: Int;
}

contract TestContract {
    optNested: OptionNest;

    init() {
        self.optNested = OptionNest{
            flag: null,
            count: null,
            text: null,
            nested: null,
        };
    }
}