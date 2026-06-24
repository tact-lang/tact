struct InnerNested {
    x: Int;
    y: String?;
}

contract OptionalInNestedStruct {
    val: InnerNested;
    init() {
        self.val = InnerNested{ x: 42, y: null };
    }
}