struct Leaf {
    z: Int;
}
struct Branch {
    y: Leaf;
}
struct Root {
    x: Branch;
}

contract DeepNest {
    root: Root;

    init() {
        self.root = Root{
            x: Branch{
                y: Leaf{
                    z: 555
                }
            }
        };
    }
}