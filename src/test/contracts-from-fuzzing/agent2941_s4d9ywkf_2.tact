struct InnerMost {
    val1: Int;
    val2: Bool;
    val3: String;
}

struct Inner {
    f1: InnerMost;
    f2: Bool;
}

struct Outer {
    nested: Inner;
    flag: Bool;
    txt: String;
}

contract DeepTripleNest {
    state: Outer;

    init() {
        self.state = Outer{
            nested: Inner{
                f1: InnerMost{
                    val1: 42,
                    val2: true,
                    val3: "hello",
                },
                f2: false,
            },
            flag: true,
            txt: "world",
        };
    }
}