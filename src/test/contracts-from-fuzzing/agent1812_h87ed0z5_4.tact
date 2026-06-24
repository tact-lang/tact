struct DeepNested {
    lvl1: Level1;
}

struct Level1 {
    lvl2: Level2;
}

struct Level2 {
    lvl3: Level3;
}

struct Level3 {
    val: Int;
}

contract DeepTest {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            lvl1: Level1{
                lvl2: Level2{
                    lvl3: Level3{
                        val: 42
                    }
                }
            }
        };
    }
}
