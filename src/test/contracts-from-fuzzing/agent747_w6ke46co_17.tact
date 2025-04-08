contract TestContract {
    s: S;

    init() {
        self.s = S{
            x: 7,
            y: null
        };
    }
}

struct S {
    x: Int;
    y: Inner?;
}

struct Inner {
    f: Bool;
}
