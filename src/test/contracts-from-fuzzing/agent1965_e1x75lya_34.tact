struct NestedStrings {
    s1: String;
    s2: String;
    optional: String?;
}

contract ContractWithNestedStrings {
    data: NestedStrings;
    init() {
        self.data = NestedStrings{ s1: "hello", s2: "world", optional: null };
    }
}