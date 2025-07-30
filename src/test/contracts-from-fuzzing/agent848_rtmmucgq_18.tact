struct NestedOptionalStruct {
    foo: Int?;
}

contract NestedOptionalField {
    data: NestedOptionalStruct?;

    init() {
        self.data = NestedOptionalStruct{foo: null};
    }
}