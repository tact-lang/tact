struct Leaf {
    x: Int;
    y: Bool;
}

struct Mid {
    a: Leaf;
    b: Leaf;
}

struct Root {
    left: Mid;
    right: Mid;
}

contract BalancedTreeStorage {
    root: Root;

    init() {
        self.root = Root{
            left: Mid{
                a: Leaf{ x:1, y:true },
                b: Leaf{ x:2, y:false }
            },
            right: Mid{
                a: Leaf{ x:3, y:true },
                b: Leaf{ x:4, y:false }
            }
        };
    }
}