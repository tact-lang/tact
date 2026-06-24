struct InnerA { a: Int; b: Bool; }
struct InnerB { s: String; t: Bool?; }

struct Compound {
    a1: InnerA;
    b1: InnerB;
    s2: String;
    optionalInnerA: InnerA?;
    optionalInnerB: InnerB?;
}

contract CompoundNestedOpts {
    info: Compound;

    init() {
        self.info = Compound{
            a1: InnerA{ a: 1, b: true },
            b1: InnerB{ s: "test", t: false },
            s2: "hello",
            optionalInnerA: null,
            optionalInnerB: null
        };
    }
}