struct Nested {
    x: Int;
    y: Bool?;
}

struct Outer {
    nested: Nested;
    flag: Bool;
    optInt: Int?;
}

contract TestContract {
    field: Outer;

    init() {
        self.field = Outer{
            nested: Nested{ x: 5, y: null },
            flag: true,
            optInt: null,
        };
    }
}