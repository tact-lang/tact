struct Leaf {
    x: Int;
    y: Int;
}

struct InnerTree {
    left: Leaf;
    right: Leaf;
}

struct OuterTree {
    branch: InnerTree;
    flag: Bool;
}

contract DeepTreeStruct {
    t: OuterTree;

    init() {
        self.t = OuterTree{
            branch: InnerTree{
                left: Leaf{ x: 1, y: 2 },
                right: Leaf{ x: 3, y: 4 }
            },
            flag: true
        };
    }
}
