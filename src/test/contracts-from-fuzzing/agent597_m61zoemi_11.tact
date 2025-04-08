struct Inner {
    foo: Int?;
}

struct Middle {
    a: Inner;
    b: Int;
}

struct Outer {
    mid: Middle;
    c: Int?;
}

contract NestedOptionals {
    storage: Outer;

    init() {
        self.storage = Outer{
            mid: Middle{
                a: Inner{ foo: 77 },
                b: 55
            },
            c: null
        };
    }
}