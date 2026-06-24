struct Level3 {
    val: Int;
}

struct Level2 {
    mid: Level3;
}

struct Level1 {
    top: Level2;
}

contract DeepPersistent {
    storage: Level1;

    init() {
        self.storage = Level1{
            top: Level2{
                mid: Level3{
                    val: 5
                }
            }
        };
    }
}
