struct NestedOptField {
    foo: Int?;
    bar: Bool?;
}

contract OptionalNestedStruct {
    nestedOpt: NestedOptField?;

    init() {
        self.nestedOpt = NestedOptField{foo: 123, bar: false};
    }
}