struct NestedOptionalStruct {
    foo: Int?;
    bar: Bool?;
    baz: Address?;
}

contract TestContract {
    optField: NestedOptionalStruct?;

    init() {
        self.optField = null;
    }
}