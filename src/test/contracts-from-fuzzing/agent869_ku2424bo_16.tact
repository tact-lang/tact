struct NestedStrings {
    s1: String;
    s2: String?;
}

contract StringNest {
    data: NestedStrings;

    init() {
        self.data = NestedStrings{
            s1: "abc",
            s2: null,
        };
    }

    receive() {}
}
