struct Nested {
    deep: Int?;
    deeper: String?;
    deepest: Slice?;
}

struct Top {
    a: Int;
    nest: Nested;
}

contract OptionalNest {
    foo: Top;
    init() {
        self.foo = Top{
            a: 10,
            nest: Nested{
                deep: null,
                deeper: null,
                deepest: null
            }
        };
    }
}