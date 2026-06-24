struct Leaf {
    x: Int;
}

struct Middle {
    leaf: Leaf;
}

struct Root {
    middle: Middle;
}

contract OptDeepNested {
    root_opt: Root?;

    init() {
        self.root_opt = Root{
            middle: Middle{
                leaf: Leaf{
                    x: 100
                }
            }
        };
    }
}