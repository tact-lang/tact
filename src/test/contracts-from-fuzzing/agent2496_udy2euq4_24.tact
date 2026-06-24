struct NestedOptionalStruct {
    a: Int;
    maybeB: Bool?;
    maybeS: String?;
}

contract WithNestedOptionalStruct {
    nested: NestedOptionalStruct?;

    init() {
        self.nested = null;
    }
}
