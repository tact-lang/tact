struct Leaf {
    one: Int;
}

struct Branch1 {
    leaf: Leaf;
    optionalLeaf: Leaf?;
}

struct Branch2 {
    optionInt: Int?;
    branch1: Branch1;
}

struct Root {
    branch: Branch2;
}

contract HeavyTree {
    storage: Root;

    init() {
        self.storage = Root{
            branch: Branch2{
                optionInt: 123,
                branch1: Branch1{
                    leaf: Leaf{one: 99},
                    optionalLeaf: null
                }
            }
        };
    }
}