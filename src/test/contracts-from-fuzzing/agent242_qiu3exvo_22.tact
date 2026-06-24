struct Inner {
    a: Int? = 17;
    b: Bool? = true;
}

contract StructHasDefaults {
    nested: Inner;
    init() {
        self.nested = Inner{};
    }
}