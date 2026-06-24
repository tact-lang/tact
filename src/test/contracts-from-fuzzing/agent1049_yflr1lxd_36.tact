struct TwoDeepOptional {
    child1: Int?;
    child2: Bool?;
}

struct TopWrap {
    nested: TwoDeepOptional?;
    other: String;
}

contract OptionalNestedOption {
    foo: TopWrap;

    init() {
        self.foo = TopWrap{
            nested: null,
            other: "abc"
        };
    }
}