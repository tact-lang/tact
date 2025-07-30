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
    lvl4: Level4;
}

struct Level4 {
    val: Int;
}

contract TestContract {
    nested: DeepNested;

    init() {
        self.nested = DeepNested{
            lvl1: Level1{
                lvl2: Level2{
                    lvl3: Level3{
                        lvl4: Level4{
                            val: 42
                        }
                    }
                }
            }
        };
    }
}