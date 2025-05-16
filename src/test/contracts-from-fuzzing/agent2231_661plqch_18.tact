struct ChainManyLevels {
    first: Level1;
}

struct Level1 {
    second: Level2;
}

struct Level2 {
    third: Level3;
}

struct Level3 {
    val: Int;
}

contract ManyLevelsContract {
    item: ChainManyLevels;

    init() {
        self.item = ChainManyLevels{
            first: Level1{
                second: Level2{
                    third: Level3{
                        val:100
                    }
                }
            }
        };
    }
}