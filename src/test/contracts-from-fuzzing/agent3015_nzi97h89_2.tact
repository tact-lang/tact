struct InnerMost {
    v1: Bool;
    v2: String;
}

struct Inner {
    i1: Int;
    i2: Bool;
    nested: InnerMost;
}

struct Outer {
    innerStruct: Inner;
    x: Int;
}

contract VeryDeepStruct {
    st: Outer;

    init() {
        self.st = Outer{
            innerStruct: Inner{
                i1: 5,
                i2: false,
                nested: InnerMost{v1: true, v2: "hi"}
            },
            x: 99
        };
    }
}