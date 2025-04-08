struct Leaf {
    val: Int;
}

struct Mid {
    leaf: Leaf?;
}

struct Root {
    mid: Mid?;
}

contract TestContract {
    nestedOpt: Root;

    init() {
        self.nestedOpt = Root{
            mid: Mid{
                leaf: Leaf{
                    val: 123
                }
            }
        };
    }
}
