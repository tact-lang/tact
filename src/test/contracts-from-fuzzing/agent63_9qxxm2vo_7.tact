struct Level3 {
    z: Int;
}

struct Level2 {
    nested: Level3;
}

struct Level1 {
    nested: Level2;
}

contract DeepNest {
    storage: Level1;

    init() {
        self.storage = Level1{
            nested: Level2{
                nested: Level3{
                    z: 999
                }
            }
        };
    }
}