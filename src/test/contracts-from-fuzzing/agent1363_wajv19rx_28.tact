struct Leaf {
    foo: Int?;
    flag: Bool?;
}

struct MidLevel {
    a: Leaf?;
    b: Int?;
}

struct Root {
    x: MidLevel?;
    y: String;
}

contract NestedOptionalProp {
    data: Root;

    init() {
        self.data = Root{
            x: MidLevel{
                a: null,  // propagate null here
                b: 999,
            },
            y: "root string",
        };
    }
}