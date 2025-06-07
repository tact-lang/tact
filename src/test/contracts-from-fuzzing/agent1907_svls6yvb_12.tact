struct InlineInner {
    foo: Int;
    bar: Bool?;
}

contract InlineNestedFields {
    aa: InlineInner;
    bb: InlineInner;

    init() {
        self.aa = InlineInner{ foo: 11, bar: null };
        self.bb = InlineInner{ foo: 22, bar: true };
    }
}