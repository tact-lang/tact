struct InnerMost {
    v: Int as int16;
}

struct Inner {
    a: InnerMost;
    b: Bool?;
}

struct Mid {
    x: Inner;
    s: String;
}

contract DeepChain {
    m: Mid;

    init() {
        self.m = Mid{
            x: Inner{
                a: InnerMost{ v: 100 },
                b: null,
            },
            s: "chain",
        };
    }
}