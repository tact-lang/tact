struct Nested {
    inner1: Int;
    inner2: Bool?;
    deepOpt: Int?;
}

struct Outer {
    a: Nested;
    b: Int?;
}

contract HasNested {
    data: Outer;

    init() {
        self.data = Outer{
            a: Nested{
                inner1: 10,
                inner2: null,
                deepOpt: null
            },
            b: null
        };
    }
}