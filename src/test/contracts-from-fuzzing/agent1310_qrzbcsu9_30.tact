struct Top {
    nested: Nested;
}

struct Nested {
    maybe: Int?;
    subnested: SubNested?;
}

struct SubNested {
    value: Int;
}

contract OptionalLayered {
    data: Top;
    init() {
        self.data = Top{
            nested: Nested{
                maybe: null,
                subnested: null
            }
        };
    }
}