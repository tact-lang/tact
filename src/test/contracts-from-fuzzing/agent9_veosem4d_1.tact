contract DeepNestTest {
    data: Outer;

    init() {
        self.data = Outer{
            mid: Middle{
                inner: Inner{
                    a: 1,
                    b: 2
                },
                c: 3
            },
            d: 4
        };
    }
}

struct Outer {
    mid: Middle;
    d: Int;
}

struct Middle {
    inner: Inner;
    c: Int;
}

struct Inner {
    a: Int;
    b: Int;
}
