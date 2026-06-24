struct NestedStruct {
    inner: Int?;
}

contract NestedOptionalField {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{ inner: null };
    }
}