struct SubS {
    a: Int;
    b: Int?;
}

struct Top {
    s1: SubS;
    s2: SubS;
    optionalField: Bool?;
    n: Int;
}

contract WideNestedOptional {
    data: Top;

    init() {
        self.data = Top{
            s1: SubS{ a: 1, b: null },
            s2: SubS{ a: 2, b: 3 },
            optionalField: true,
            n: 42
        };
    }
}