struct Level3 {
    val3: Int;
}

struct Level2 {
    val2: Level3;
}

struct Level1 {
    val1: Level2;
}

contract DeepNest {
    data: Level1;

    init() {
        self.data = Level1{
            val1: Level2{
                val2: Level3{ val3: 999 }
            }
        };
    }
}