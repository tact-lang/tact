struct Nested {
    a: Int;
    b: Bool;
}

struct Outer {
    nested: Nested;
    flag: Bool;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Nested{
                a: 5,
                b: true,
            },
            flag: false,
        };
    }
}
