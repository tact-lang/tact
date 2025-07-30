struct NestedStrings {
    inner1: String;
    inner2: String?;
}

struct OuterStrings {
    s: String;
    opt: NestedStrings;
}

contract NestedStructStrings {
    test: OuterStrings;

    init() {
        self.test = OuterStrings{
            s: "outer",
            opt: NestedStrings{ inner1: "i1", inner2: null }
        };
    }
}