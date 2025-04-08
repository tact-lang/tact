struct DeepNest {
    a: Bool;
    b: Nested;
}

struct Nested {
    c: Bool;
    d: Deeper;
}

struct Deeper {
    e: Int;
}

contract Test3 {
    data: DeepNest;
    init() {
        self.data = DeepNest{
            a: true,
            b: Nested{
                c: false,
                d: Deeper{
                    e: 777,
                },
            },
        };
    }
}