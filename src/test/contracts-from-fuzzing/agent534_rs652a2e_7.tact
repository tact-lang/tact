struct Level3 {
    deep: Int;
}

struct Level2 {
    nested: Level3;
    maybeNested: Level3?;
}

struct Level1 {
    l2: Level2;
    maybeL2: Level2?;
}

contract DeepNest {
    root: Level1;

    init() {
        self.root = Level1{
            l2: Level2{
                nested: Level3{deep: 99},
                maybeNested: null,
            },
            maybeL2: null,
        };
    }
}