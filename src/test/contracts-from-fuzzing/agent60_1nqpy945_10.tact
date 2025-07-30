struct NestedStrings {
    innerStr: String;
    optInnerStr: String?;
}

struct HasStrings {
    s1: String;
    s2: String?;
    nested: NestedStrings;
}

contract TestContract {
    st: HasStrings;

    init() {
        self.st = HasStrings{
            s1: "hello",
            s2: null,
            nested: NestedStrings{ innerStr: "world", optInnerStr: null }
        };
    }
}