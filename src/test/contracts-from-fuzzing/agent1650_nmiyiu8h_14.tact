struct NestedStrings {
    str1: String;
    str2: String;
}

struct WithNestedStrings {
    data: NestedStrings;
}

contract StringsNested {
    stuff: WithNestedStrings;

    init() {
        self.stuff = WithNestedStrings{
            data: NestedStrings{
                str1: "hello",
                str2: "world",
            },
        };
    }
}