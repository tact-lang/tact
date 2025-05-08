contract OptionalMiddle {
    nested: Outer;

    init() {
        self.nested = Outer{
            sub: Middle{
                inner: null
            }
        };
    }
}

struct Outer {
    sub: Middle;
}

struct Middle {
    inner: Inner?;
}

struct Inner {
    x: Int;
}
