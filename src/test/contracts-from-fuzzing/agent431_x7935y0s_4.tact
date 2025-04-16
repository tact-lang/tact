struct InnerMost {
    x: Int;
    flag: Bool?;
}

struct Inner {
    im: InnerMost?;
    s: String;
    n: Int?;
}

struct Outer {
    inner: Inner;
    y: Int;
}

contract NestedStorage {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                im: InnerMost{
                    x: 17,
                    flag: true,
                },
                s: "abc",
                n: null,
            },
            y: 123,
        };
    }

    receive() {}
}