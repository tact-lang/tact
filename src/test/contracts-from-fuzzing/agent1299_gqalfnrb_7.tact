struct Leaf {
    x: Int;
    y: Int;
}
struct Branch {
    left: Leaf?;
    right: Leaf?;
}
struct Root {
    branch: Branch?;
}

contract OptionalsTree {
    root: Root;

    init() {
        self.root = Root{
            branch: Branch{
                left: null,
                right: Leaf{ x:1, y:2 }
            }
        };
    }
}