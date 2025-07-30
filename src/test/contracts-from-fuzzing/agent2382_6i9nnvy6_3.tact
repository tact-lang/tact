struct Level3 {
    deepVal: Int;
}

struct Level2 {
    midVal: Level3;
}

struct Level1 {
    topVal: Level2;
}

contract DeepNest {
    storage: Level1;

    init() {
        self.storage = Level1{
            topVal: Level2{
                midVal: Level3{
                    deepVal: 99
                }
            }
        };
    }
}