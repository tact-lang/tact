contract ManyNestedOptionals {
    root: Root;

    init() {
        self.root = Root{
            nested: Nested{
                a: null,
                b: 1,
                c: null,
                d: true,
                e: null,
                f: false,
                g: null,
                h: 100,
                i: null
            },
            val: 42
        };
    }
}

struct Root {
    nested: Nested;
    val: Int;
}

struct Nested {
    a: Int?;
    b: Int;
    c: Int?;
    d: Bool?;
    e: Bool?;
    f: Bool;
    g: Int?;
    h: Int;
    i: Bool?;
}
