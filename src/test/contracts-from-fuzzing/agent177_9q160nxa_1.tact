struct Inner {
    a: Int;
    b: Bool?;
    c: String;
}

struct Outer {
    inner: Inner;
    x: Int;
    y: String?;
}

contract C {
    data: Outer;
    init() {
        self.data = Outer{
            inner: Inner{ a: 1, b: true, c: "ok" },
            x: 42,
            y: null
        };
    }
}