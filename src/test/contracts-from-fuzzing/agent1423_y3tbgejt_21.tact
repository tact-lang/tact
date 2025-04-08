struct NestedStrings {
    s1: String;
    s2: String;
}

struct StringsContainer {
    payload: NestedStrings;
}

contract StringsNested {
    s: StringsContainer;
    init() {
        self.s = StringsContainer{
            payload: NestedStrings{
                s1: "abc",
                s2: "def"
            }
        };
    }
}