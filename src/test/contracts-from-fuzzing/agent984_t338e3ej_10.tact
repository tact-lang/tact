struct Inner {
    a: Int;
    b: Bool?;
}

struct Mid {
    i1: Inner;
    i2: Inner?;
}

struct Outer {
    m1: Mid;
    m2: Mid?;
    x: String;
}

contract ComplexNestedOptionals {
    o: Outer;

    init() {
        self.o = Outer{
            m1: Mid{
                i1: Inner{a: 1, b: true},
                i2: null
            },
            m2: null,
            x: "hello"
        };
    }
}