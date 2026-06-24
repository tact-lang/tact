struct InnerS {
    x: Int;
    y: Int?;
}

struct OuterS {
    s1: InnerS;
    s2: InnerS?;
    s3: Int;
}

contract NullableNested {
    d: OuterS;

    init() {
        self.d = OuterS{
            s1: InnerS{ x: 1, y: 2 },
            s2: null,
            s3: 3
        };
    }
}