struct NestedStr {
    text: String;
}

struct ContainsNested {
    nested: NestedStr;
    comment: String;
}

contract CompoundText {
    data: ContainsNested;

    init() {
        self.data = ContainsNested{ nested: NestedStr{ text: "innermost" }, comment: "outermost" };
    }
}
