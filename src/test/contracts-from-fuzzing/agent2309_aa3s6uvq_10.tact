struct InlineDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: Cell? = null;
    d: Slice? = null;
}

contract DefOptVals {
    data: InlineDefaults;
    init() {
        self.data = InlineDefaults{};
    }
}