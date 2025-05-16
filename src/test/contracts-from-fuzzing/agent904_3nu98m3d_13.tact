struct InnerStruct {
    i: Int;
    b: Bool;
}

contract InlineNested {
    nested: InnerStruct;
    inlineVal: Int;
    init() {
        self.nested = InnerStruct{ i: 3, b: true };
        self.inlineVal = 99;
    }
}