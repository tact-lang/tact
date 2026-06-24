struct Level3 {
    leaf: Int;
}

struct Level2 {
    branch: Level3;
}

struct Level1 {
    root: Level2;
}

contract DeepNestedStorage {
    tree: Level1 = Level1{
        root: Level2{
            branch: Level3{
                leaf: 0,
            },
        },
    };
}