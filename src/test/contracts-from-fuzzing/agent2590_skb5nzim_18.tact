struct BoolOptDefault {
    f: Bool? = null;
}

contract OptionalDefaultField {
    foo: BoolOptDefault;
    init() {
        self.foo = BoolOptDefault{}; // default null
    }
}