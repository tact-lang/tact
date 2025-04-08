struct Level3 {
    leaf: String;
    optLeaf: Int?;
}

struct Level2 {
    node: Level3;
    flag: Bool;
}

struct Level1 {
    root: Level2;
    label: String;
}

contract DeepNest {
    tree: Level1;

    init() {
        self.tree = Level1{
            root: Level2{
                node: Level3{
                    leaf: "deep",
                    optLeaf: 77,
                },
                flag: true,
            },
            label: "root",
        };
    }
}