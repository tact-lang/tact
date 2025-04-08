contract OptionalNested {
    data: Outer?;

    init() {
        self.data = Outer{
            a: 1,
            nested: Inner{
                b: 2
            }
        };
    }
}

struct Outer {
    a: Int;
    nested: Inner;
}

struct Inner {
    b: Int;
}
