struct Leaf {
    val: Int;
}

struct Branch {
    left: Leaf?;
    right: Leaf?;
}

struct Root {
    branch: Branch;
}

contract OptionTree {
    storage: Root;

    init() {
        self.storage = Root{
            branch: Branch{
                left: Leaf{ val: 10 },
                right: null
            }
        };
    }
}