struct Leaf {
    n: Int;
}

struct NodeLevel2 {
    left: Leaf;
    right: Leaf;
}

struct NodeLevel1 {
    left: NodeLevel2;
    right: NodeLevel2;
}

contract DeepTreeContract {
    root: NodeLevel1;
    
    init() {
        self.root = NodeLevel1{
            left: NodeLevel2{
                left: Leaf{n:1},
                right: Leaf{n:2}
            },
            right: NodeLevel2{
                left: Leaf{n:3},
                right: Leaf{n:4}
            }
        };
    }
}