struct NestedStrings {
    s1: String;
    s2: String?;
}

contract ContractWithNestedStrings {
    nested: NestedStrings;

    init() {
        self.nested = NestedStrings{ s1: "foo", s2: null };
    }
}