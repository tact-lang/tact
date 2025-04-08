contract TestContract {
    nested: Outer;

    init() {
        self.nested = Outer{
            foo: 123,
            inner: Inner{
                a: 1,
                b: 2,
                deeper: Deeper{
                    flag: true,
                    label: "deep"
                }
            }
        };
    }
}

struct Outer {
    foo: Int;
    inner: Inner;
}

struct Inner {
    a: Int;
    b: Int;
    deeper: Deeper;
}

struct Deeper {
    flag: Bool;
    label: String;
}