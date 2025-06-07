struct InnerMost {
    z: Int;
}

struct Inner {
    b: Bool;
    im: InnerMost;
}

struct Outer {
    i: Int;
    s: String;
    inner: Inner;
    opt: Inner?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            i: 1,
            s: "Hello",
            inner: Inner{
                b: true,
                im: InnerMost{ z: 123 },
            },
            opt: null,
        };
    }

    receive() {}
}
