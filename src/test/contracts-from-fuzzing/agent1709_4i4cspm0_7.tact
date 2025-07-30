struct InnerOpt {
    b: Bool?;
    s: String;
}

contract OptionalPrimitiveInNestedStruct {
    nested: InnerOpt;

    init() {
        self.nested = InnerOpt{ b: null, s: "s" };
    }
}