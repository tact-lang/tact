struct InnerMost {
    flag: Bool;
}

struct Inner {
    count: Int;
    im: InnerMost;
}

struct Outer {
    name: String;
    inner: Inner;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            name: "deep",
            inner: Inner{
                count: 100,
                im: InnerMost{
                    flag: true,
                },
            },
        };
    }
}
