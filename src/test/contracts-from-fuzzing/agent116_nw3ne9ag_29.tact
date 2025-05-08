contract UltimateEdge {
    foo: Outer;

    init() {
        self.foo = Outer{
            a: 5,
            nested: Nested{
                b: null,
                deep: Deep{
                    c: 42,
                    d: null
                }
            }
        };
    }
}

struct Outer {
    a: Int as uint32 = 1;
    nested: Nested;
}

struct Nested {
    b: Bool? = null;
    deep: Deep;
}

struct Deep {
    c: Int as int16 = 2;
    d: String? = null;
}
