struct NestedStrings {
    s1: String;
    s2: String;
}

struct WrapStrings {
    nested1: NestedStrings;
    nested2: NestedStrings;
}

contract MultiNestedStrings {
    store: WrapStrings;

    init() {
        self.store = WrapStrings{
            nested1: NestedStrings{ s1:"x", s2:"y" },
            nested2: NestedStrings{ s1:"a", s2:"b" }
        };
    }
}
