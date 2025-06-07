struct S {
    a: Inner?;
    b: Inner?;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract Test {
    s: S;

    init() {
        self.s = S{
            a: null,
            b: Inner{ x: 5, y: true }
        };
    }
}
