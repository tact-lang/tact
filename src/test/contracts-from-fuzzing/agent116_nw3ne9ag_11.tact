contract DefaultsAndNested {
    foo: Outer;

    init() {
        self.foo = Outer{
            val: 99,
            nested: Nested{
                a: null,
                b: 123,
                c: false
            }
        };
    }
}

struct Outer {
    val: Int = 1;
    nested: Nested;
}

struct Nested {
    a: Int?;
    b: Int = 42;
    c: Bool = true;
}
