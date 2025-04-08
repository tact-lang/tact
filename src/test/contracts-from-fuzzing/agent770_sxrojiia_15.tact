struct Deep {
    nested: Nested;
}

struct Nested {
    leaf: Leaf;
}

struct Leaf {
    optionalInt: Int?;
}

contract TestContract {
    storage: Deep;

    init() {
        self.storage = Deep{
            nested: Nested{
                leaf: Leaf{
                    optionalInt: null
                }
            }
        };
    }
}