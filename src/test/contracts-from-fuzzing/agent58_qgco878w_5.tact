struct Level3 {
    val3: Int;
}

struct Level2 {
    lev3: Level3;
}

struct Level1 {
    lev2: Level2;
}

contract DeepStructNest {
    root: Level1;

    init() {
        self.root = Level1{
            lev2: Level2{
                lev3: Level3{
                    val3: 42,
                },
            },
        };
    }
}