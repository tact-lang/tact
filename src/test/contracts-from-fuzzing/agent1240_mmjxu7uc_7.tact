contract DeepNest {
    outer: Outer;

    init() {
        self.outer = Outer{
            middle: Middle{
                inner: Inner{
                    val: 123,
                    flag: false
                },
                ok: true
            },
            label: "hi"
        };
    }
}

struct Outer {
    middle: Middle;
    label: String;
}

struct Middle {
    inner: Inner;
    ok: Bool;
}

struct Inner {
    val: Int;
    flag: Bool;
}
