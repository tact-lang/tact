struct NestedStringsOpt {
    s1: String?;
    s2: String?;
}

contract OuterWithNullStrings {
    data: NestedStringsOpt = NestedStringsOpt{
        s1: null,
        s2: null,
    };
    init() {
        self.data = NestedStringsOpt{
            s1: "abc",
            s2: "def",
        };
    }
}
