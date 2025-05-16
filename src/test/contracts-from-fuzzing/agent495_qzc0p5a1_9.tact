struct DeepDefaults {
    lvl1: Level1;
}

struct Level1 {
    lvl2: Level2;
}

struct Level2 {
    val1: Int = 10;
    val2: Bool = true;
}

contract WithNestedDefaults {
    storage: DeepDefaults;

    init() {
        self.storage = DeepDefaults{
            lvl1: Level1{
                lvl2: Level2{}
            }
        };
    }
}