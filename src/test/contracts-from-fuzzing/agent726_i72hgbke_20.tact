// Chain of nested structs with optionals and defaults
struct Leaf {
    v: Int = 11;
}

struct Mid {
    leaf: Leaf?;
}

struct Root {
    mid: Mid?;
}

contract ComplexOptionalDefault {
    storage: Root;

    init() {
        self.storage = Root{
            mid: Mid{
                leaf: Leaf{},
            },
        };
    }

    receive() {
        self.storage = Root{
            mid: Mid{
                leaf: null,
            },
        };
    }
}