struct Inner {
    a: Int;
    b: Bool?;
}

struct Outer {
    inner: Inner;
    c: String;
    d: Bool?;
}

contract TestContract {
    s: Outer;

    init() {
        self.s = Outer{
            inner: Inner{
                a: 1,
                b: true,
            },
            c: "hello",
            d: false,
        };
    }
}