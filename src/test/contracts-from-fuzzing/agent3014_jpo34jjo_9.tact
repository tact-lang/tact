struct NestedStrings {
    s1: String;
    s2: String;
    s3: String;
}

struct WrapStrings {
    nested: NestedStrings;
    optNested: NestedStrings?;
}

contract TestContract {
    store: WrapStrings;

    init() {
        self.store = WrapStrings{
            nested: NestedStrings{ s1:"a", s2:"b", s3:"c" },
            optNested: null,
        };
    }
}