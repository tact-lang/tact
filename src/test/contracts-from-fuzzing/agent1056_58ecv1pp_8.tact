struct Leaf {
    x: Int?;
    y: Bool;
}

struct Middle {
    a: Leaf?;
    b: String?;
    c: Int;
}

struct Top {
    m: Middle?;
    name: String;
}

contract MixedNestedOptionals {
    field: Top;

    init() {
        self.field = Top{
            m: Middle{
                a: null,
                b: "middle",
                c: 7,
            },
            name: "outer",
        };
    }
}