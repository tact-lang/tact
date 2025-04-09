struct NestedStrings {
    inner: Deeper;
    text: String;
}

struct Deeper {
    s1: String;
    s2: String?;
}

contract StringNest {
    data: NestedStrings;

    init() {
        self.data = NestedStrings{
            inner: Deeper{
                s1: "foo",
                s2: null
            },
            text: "bar"
        };
    }
}