struct NestedStrings {
    s1: String;
    s2: Inner;
}

struct Inner {
    a: Int;
    str: String;
}

contract StringsContract {
    data: NestedStrings;

    init() {
        self.data = NestedStrings{
            s1: "outer",
            s2: Inner{ a: 1, str: "inner" },
        };
    }
}
