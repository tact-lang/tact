struct NestedStr {
    s: String;
}

contract StringContainer {
    nested: NestedStr;

    init() {
        self.nested = NestedStr{ s: "hi" };
    }
}