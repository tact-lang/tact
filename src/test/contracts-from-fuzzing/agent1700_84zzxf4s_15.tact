struct Level3 {
    s: String?;
}

struct Level2 {
    nested: Level3;
}

struct Level1 {
    nested: Level2;
}

contract Nested3LevelsOpt {
    data: Level1;

    init() {
        self.data = Level1{
            nested: Level2{
                nested: Level3{
                    s: "deepest string"
                }
            }
        };
    }
}
