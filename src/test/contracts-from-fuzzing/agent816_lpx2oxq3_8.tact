struct NestedOption {
    optInt: Int?;
    optBool: Bool?;
}

struct TopLevel {
    inner1: NestedOption;
    inner2: NestedOption?;
}

contract OptionalCombinations {
    val: TopLevel;

    init() {
        self.val = TopLevel{
            inner1: NestedOption{ optInt: null, optBool: null },
            inner2: null,
        };
    }
}
