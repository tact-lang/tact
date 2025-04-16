struct NestedOptionalString {
    s: String?;
}

contract OptionalStringPersistent {
    ns: NestedOptionalString;
    init() {
        self.ns = NestedOptionalString{
            s: null
        };
    }
}