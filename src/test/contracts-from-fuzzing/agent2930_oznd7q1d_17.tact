struct NestedOptDef {
    a: Int? = null;
    b: Bool? = null;
}

contract OptDefaults {
    field: NestedOptDef;

    init() {
        self.field = NestedOptDef{};
    }
}
