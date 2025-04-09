struct InnerMost { q: Int; }

struct Middle1 { inner: InnerMost; flag: Bool; }
struct Middle2 { inner: InnerMost; count: Int; }

struct Outer {
    m1: Middle1;
    m2: Middle2;
}

contract VeryNestedStructs {
    nested: Outer;

    init() {
        self.nested = Outer{
            m1: Middle1{ inner: InnerMost{ q: 5 }, flag: true },
            m2: Middle2{ inner: InnerMost{ q: 10 }, count: 2 },
        };
    }
}
