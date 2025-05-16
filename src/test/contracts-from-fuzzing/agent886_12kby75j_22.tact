struct Inner {
    a: String;
    b: String?;
}

struct Outer {
    inner: Inner;
}

contract TestContract {
    out: Outer;

    init() {
        self.out = Outer{
            inner: Inner{ a: "hello", b: null }
        };
    }
}