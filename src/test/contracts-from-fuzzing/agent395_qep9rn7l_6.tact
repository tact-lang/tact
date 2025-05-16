struct Leaf {
    flag: Bool?;
}

struct Branch {
    leaf: Leaf?;
}

struct Root {
    branch: Branch?;
}

contract DeepOptChain {
    data: Root;

    init() {
        self.data = Root{
            branch: Branch{
                leaf: Leaf{
                    flag: null
                }
            }
        };
    }
}
