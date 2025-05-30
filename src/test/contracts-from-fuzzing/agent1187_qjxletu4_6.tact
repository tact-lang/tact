struct Level3 {
    val3: Int;
}

struct Level2 {
    val2: Level3;
}

struct Level1 {
    val1: Level2;
}

contract DeepLevels {
    nested: Level1 = Level1{
        val1: Level2{
            val2: Level3{
                val3: 123
            }
        }
    };

    init() {
        self.nested = Level1{
            val1: Level2{
                val2: Level3{
                    val3: 456
                }
            }
        };
    }
}