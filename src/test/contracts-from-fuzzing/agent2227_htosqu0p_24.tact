struct NestedWithString {
    innerStr: String;
}

contract PersistNestedString {
    nested: NestedWithString;

    init() {
        self.nested = NestedWithString{ innerStr: "deep" };
    }
}