struct M {
    inner: S;
    s: String;
}

struct S {
    i: Int;
    b: Bool;
    t: T;
}

struct T {
    opt: Bool?;
    str: String?;
}

contract DeepNestOpt {
    m: M;

    init() {
        self.m = M{
            inner: S{
                i: 1,
                b: true,
                t: T{ opt: null, str: null },
            },
            s: "hi",
        };
    }
}
