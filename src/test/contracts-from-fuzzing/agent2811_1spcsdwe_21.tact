struct LeafA { x:Int; }
struct LeafB { y:Int; }

struct Branch {
    left: LeafA;
    right: LeafB;
}

contract TreeStorage {
    tree: Branch;

    init() {
        self.tree = Branch{
            left:LeafA{x:1},
            right:LeafB{y:2}
        };
    }
}