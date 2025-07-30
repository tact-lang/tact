struct Deep {
    num: Int;
    flag: Bool;
}

struct Nested {
    level: Int;
    deep: Deep;
}

struct Top {
    label: String;
    nested: Nested;
}

contract Test3 {
    field: Top;

    init() {
        self.field = Top{
            label: "top",
            nested: Nested{
                level: 10,
                deep: Deep{
                    num: 123,
                    flag: false
                }
            }
        };
    }
}