struct NestedStrings {
    a: InnerOne;
    b: InnerTwo;
}

struct InnerOne {
    s: String;
}

struct InnerTwo {
    t: String;
}

contract NestStr {
    f: NestedStrings;

    init() {
        self.f = NestedStrings{
            a: InnerOne{ s: "Hi" },
            b: InnerTwo{ t: "World" },
        };
    }
}