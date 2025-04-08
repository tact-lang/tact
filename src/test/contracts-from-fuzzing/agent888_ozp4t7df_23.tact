struct InlineNested {
    a: Int;
    b: String;
}

contract InlineNesting {
    nested: InlineNested;

    init() {
        self.nested = InlineNested{ a: 42, b: "hi" };
    }
}