struct Level3 {
    val: Int;
}

struct Level2 {
    nested: Level3;
}

struct Level1 {
    nested: Level2;
}

contract DeepLevels {
    payload: Level1;

    init() {
        self.payload = Level1{
            nested: Level2{
                nested: Level3{
                    val: 555,
                },
            },
        };
    }
}