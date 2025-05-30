struct InnerMost {
    a: Int as uint8;
}

struct Mid {
    b: InnerMost;
}

struct Outer {
    c: Mid;
}

contract NestedSerializationComplex {
    data: Outer;

    init() {
        self.data = Outer{
            c: Mid{ b: InnerMost{ a: 5 } }
        };
    }
}