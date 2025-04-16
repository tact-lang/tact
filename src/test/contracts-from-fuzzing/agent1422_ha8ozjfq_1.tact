struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    inner: Inner;
    c: String;
    d: Int?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                a: 1,
                b: true,
            },
            c: "hello",
            d: null,
        };
    }
}