struct Inner {
    foo: Int;
}

struct Mid {
    i1: Inner;
    i2: Inner;
}

struct Outer {
    m1: Mid;
    m2: Mid;
}

contract DeeplyNestedStructs {
    val: Outer;

    init() {
        self.val = Outer{
            m1: Mid{
                i1: Inner{foo: 1},
                i2: Inner{foo: 2}
            },
            m2: Mid{
                i1: Inner{foo: 3},
                i2: Inner{foo: 4}
            }
        };
    }
}