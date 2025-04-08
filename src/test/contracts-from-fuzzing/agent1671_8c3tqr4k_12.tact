// Deeply nested optional struct chaining, slightly different
struct Leaf {
    val: Int?;
}

struct Mid {
    leaf: Leaf?;
}

struct Root {
    mid: Mid?;
}

contract Test {
    root: Root;

    init() {
        self.root = Root{
            mid: Mid{
                leaf: Leaf{
                    val: null
                }
            }
        };
    }
}