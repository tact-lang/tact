struct NestedStrings {
    s1: String;
    s2: String?;
}

struct MiddleStrings {
    n1: NestedStrings;
    n2: NestedStrings?;
}

contract StringsMix {
    data: MiddleStrings;

    init() {
        self.data = MiddleStrings{
            n1: NestedStrings{ s1: "hi", s2: null },
            n2: null
        };
    }
}