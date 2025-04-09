struct Leaf {
    val: Int;
}

struct Branch {
    child: Leaf?;
}

struct Tree {
    branch: Branch?;
}

contract OptionalNest {
    data: Tree?;

    init() {
        self.data = Tree{
            branch: Branch{
                child: Leaf{ val: 999 }
            }
        };
    }
}