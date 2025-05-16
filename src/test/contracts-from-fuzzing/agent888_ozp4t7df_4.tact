struct InnerMost {
    val: Int;
}

struct Inner {
    first: InnerMost;
    second: InnerMost;
}

struct Middle {
    inner: Inner;
    desc: String;
}

struct Outer {
    middle: Middle;
    comment: String?;
}

contract ComplexNested {
    state: Outer;

    init() {
        self.state = Outer{
            middle: Middle{
                inner: Inner{
                    first: InnerMost{ val: 100 },
                    second: InnerMost{ val: 200 },
                },
                desc: "nested",
            },
            comment: null,
        };
    }
}