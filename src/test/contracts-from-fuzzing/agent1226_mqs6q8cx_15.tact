struct NestedStr {
    val: String;
    nested: String?;
}

contract Test {
    field: NestedStr;

    init() {
        self.field = NestedStr{ val: "hi", nested: null };
    }
}