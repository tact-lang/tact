struct OptNest {
    inner: Bool?;
}

contract NestedOptionalField {
    s: OptNest;

    init() {
        self.s = OptNest{ inner: null };
    }
}