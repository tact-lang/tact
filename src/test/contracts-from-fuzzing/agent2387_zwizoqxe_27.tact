struct Container {
    leaf: Leaf;
}

struct Leaf {
    intOpt: Int?;
    boolOpt: Bool?;
}

contract NestedOptFields {
    root: Container;
    init() {
        self.root = Container{
            leaf: Leaf{
                intOpt: null,
                boolOpt: true,
            },
        };
    }
}