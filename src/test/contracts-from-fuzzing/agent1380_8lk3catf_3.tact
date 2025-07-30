struct InnerMost {
    a: Int;
    b: Bool?;
}

struct Inner {
    im: InnerMost;
    s: String?;
}

struct Outer {
    inn: Inner;
    s: String;
}

contract TestNested {
    data: Outer;

    init() {
        self.data = Outer{
            inn: Inner{
                im: InnerMost{
                    a: 77,
                    b: true,
                },
                s: null,
            },
            s: "xyz",
        };
    }
}