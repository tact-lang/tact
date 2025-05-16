struct NestedStrings {
    inner: InnerS;
}

struct InnerS {
    s: String;
}

contract StringNest {
    data: NestedStrings;

    init() {
        self.data = NestedStrings{
            inner: InnerS{s: "hello"}
        };
    }
}