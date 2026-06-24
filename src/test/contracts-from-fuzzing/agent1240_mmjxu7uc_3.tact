contract ImplNullOpt {
    s: S;

    init() {
        self.s = S{
            inner: Inner{
                title: "huh"
            }
        };
    }
}

struct S {
    inner: Inner;
}

struct Inner {
    title: String;
    comment: String?;
    point: P?;
}

struct P {
    x: Int;
    y: Int;
}
