struct MixNested {
    a: Int;
    b: Bool;
    c: InnerS?;
}

struct InnerS {
    x: Int?;
    y: Bool?;
}

contract MixedNestedOpt {
    data: MixNested;
    init() {
        self.data = MixNested{
            a: 123,
            b: false,
            c: null,
        };
    }
}