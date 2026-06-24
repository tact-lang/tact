struct Leaf { x: Int; }
struct Middle { leaf: Leaf; }
struct Root {
    middle: Middle;
    optionalInt: Int?;
}

contract ComplexNested {
    storage: Root;

    init() {
        self.storage = Root{
            middle: Middle{
                leaf: Leaf{ x: 99 },
            },
            optionalInt: null,
        };
    }
}
