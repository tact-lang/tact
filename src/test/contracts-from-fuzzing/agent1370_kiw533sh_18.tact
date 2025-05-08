struct NestedOptionalStruct {
    x: Int;
    y: String?;
}

contract TopLevelOptionalStruct {
    s: NestedOptionalStruct?;

    init() {
        self.s = null;
    }
}