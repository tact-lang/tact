struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    inner: Inner;
    flag: Bool;
}

contract Test {
    obj: Outer;

    init() {
        self.obj = Outer{
            inner: Inner{ a: 1, b: true },
            flag: false
        };
    }
}