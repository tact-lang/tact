struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

struct Outer {
    i: Int;
    s: String;
    f: Bool;
    nested: Inner;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            i: 1,
            s: "hello",
            f: true,
            nested: Inner{ a: 2, b: false, c: "world" },
        };
    }
}
