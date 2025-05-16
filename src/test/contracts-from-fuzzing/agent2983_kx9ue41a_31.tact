struct NestedOptionalBool {
    f: Bool?;
}

contract OptBoolPersistence {
    p: NestedOptionalBool;

    init() {
        self.p = NestedOptionalBool{ f: null };
    }
}