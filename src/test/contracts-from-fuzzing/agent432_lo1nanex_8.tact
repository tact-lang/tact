struct Level3 {
    z: Bool;
}

struct Level2 {
    nested: Level3?;
}

struct Level1 {
    nested: Level2?;
}

contract DeepOptionalNested {
    root: Level1;

    init() {
        self.root = Level1{
            nested: Level2{
                nested: Level3{
                    z: true,
                },
            },
        };
    }
}
