struct LeafX {
    num: Int;
}

struct MidX {
    left: LeafX;
    right: LeafX;
}

struct TreeX {
    leftSub: MidX;
    rightVal: Int;
}

contract TreeStruct {
    tree: TreeX;

    init() {
        self.tree = TreeX{
            leftSub: MidX{
                left: LeafX{ num: 1 },
                right: LeafX{ num: 2 }
            },
            rightVal: 3
        };
    }
}