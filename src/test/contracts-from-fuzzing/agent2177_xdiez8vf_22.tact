// Compose Three Level Nested Struct with optionals
struct Leaf {
    x: Int?;
}

struct Middle {
    a: Leaf?;
    b: Leaf;
}

struct Root {
    foo: Int;
    mid: Middle;
}

contract DeepOptionalStorage {
    root: Root;

    init() {
        self.root = Root{
            foo: 1,
            mid: Middle{
                a: Leaf{x: null},
                b: Leaf{x: 2}
            }
        };
    }
}