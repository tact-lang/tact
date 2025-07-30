struct Leaf {
    val: Int?;
}

struct Mid {
    leaf: Leaf;
}

struct Root {
    mid: Mid;
}

contract TestContract {
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