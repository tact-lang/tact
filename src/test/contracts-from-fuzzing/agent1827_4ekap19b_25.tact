contract OptionalNestedString {
    nested: NestedOptString;

    init() {
        self.nested = NestedOptString{ s1: null, s2: null };
    }
}

struct NestedOptString {
    s1: String?;
    s2: String?;
}
