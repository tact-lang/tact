struct Level1 {
    val1: Int;
}

struct Level2 {
    val2: Int;
    nest1: Level1;
}

struct Level3 {
    val3: Int;
    nest2: Level2;
}

struct Level4 {
    val4: Int;
    nest3: Level3;
}

contract DeepNesting {
    data: Level4;

    init() {
        self.data = Level4{
            val4: 4,
            nest3: Level3{
                val3: 3,
                nest2: Level2{
                    val2: 2,
                    nest1: Level1{val1: 1}
                }
            }
        };
    }
}