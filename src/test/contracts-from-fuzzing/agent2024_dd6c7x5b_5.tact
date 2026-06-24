struct Inner {
    x: Int;
}

struct Mid {
    inner1: Inner;
    inner2: Inner;
}

struct Outer {
    mid1: Mid;
    mid2: Mid;
}

contract ComplexNested {
    nested: Outer;

    init() {
        self.nested = Outer{
            mid1: Mid{
                inner1: Inner{x: 1},
                inner2: Inner{x: 2}
            },
            mid2: Mid{
                inner1: Inner{x: 3},
                inner2: Inner{x: 4}
            }
        };
    }
}