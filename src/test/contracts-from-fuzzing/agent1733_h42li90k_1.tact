struct Nested {
    field1: Int;
    field2: Int?;
}

struct Outer {
    nested1: Nested;
    nested2: Nested;
    flag: Bool;
    text: String;
    number: Int;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            nested1: Nested{field1: 1, field2: null},
            nested2: Nested{field1: 2, field2: 3},
            flag: true,
            text: "Hello",
            number: 42
        };
    }
}