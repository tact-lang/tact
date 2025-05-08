struct Leaf {
    val: Int?;
}

struct Branch {
    leaf: Leaf?;
}

struct Root {
    branch: Branch?;
}

contract DeepOptPrimitive {
    state: Root;

    init() {
        self.state = Root{
            branch: Branch{
                leaf: Leaf{
                    val: null
                }
            }
        };
    }
}