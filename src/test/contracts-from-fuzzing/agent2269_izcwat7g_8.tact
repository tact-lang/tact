struct InnerOptional {
    a: Int?;
    b: Int;
}

contract StructWithInnerOptional {
    nested: InnerOptional;

    init() {
        self.nested = InnerOptional{a: null, b: 5};
    }
}
