struct InnerMost {
    a: Int;
    b: Bool?;
}

struct Inner {
    im: InnerMost;
    s: String;
    f: Address?;
}

struct Outer {
    inr: Inner;
    flag: Bool;
}

contract DeepNested {
    store: Outer;

    init() {
        self.store = Outer{
            inr: Inner{
                im: InnerMost{
                    a: 9,
                    b: true,
                },
                s: "deep",
                f: null,
            },
            flag: false,
        };
    }
}
