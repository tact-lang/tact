struct NestedOptionalStruct {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract NestedOptionalField {
    nested: NestedOptionalStruct;

    init() {
        self.nested = NestedOptionalStruct{
            a: null,
            b: null,
            c: null,
        };
    }
}