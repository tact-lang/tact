struct Leaf { n: Int }

struct Branch1 { l: Leaf }
struct Branch2 { l: Leaf }

struct Root {
    b1: Branch1;
    b2: Branch2;
}

contract TreeStruct {
    tree: Root;

    init() {
        self.tree = Root{
            b1: Branch1{ l: Leaf{ n: 1 } },
            b2: Branch2{ l: Leaf{ n: 2 } }
        };
    }
}