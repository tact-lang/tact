struct NestedOptionalStruct {
    value: Int?;
}

contract TestContract {
    nested: NestedOptionalStruct?;

    init() {
        self.nested = null;
    }
}