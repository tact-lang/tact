struct Level3 {
    deepInt: Int;
}

struct Level2 {
    lvl3: Level3;
}

struct Level1 {
    lvl2: Level2;
}

contract DeepChain {
    storage: Level1;

    init() {
        self.storage = Level1{
            lvl2: Level2{
                lvl3: Level3{
                    deepInt: 123
                }
            }
        };
    }
}