struct OptNested {
    inner: Int?;
}

contract OptionalNestedField {
    opt: OptNested;

    init() {
        self.opt = OptNested{ inner: null };
    }
}