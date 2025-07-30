struct Level3 {
    value: Int;
}

struct Level2 {
    lvl3: Level3;
}

struct Level1 {
    lvl2: Level2;
}

contract DeepNesting {
    nested: Level1;

    init() {
        self.nested = Level1{
            lvl2: Level2{
                lvl3: Level3{
                    value: 7
                }
            }
        };
    }

    receive() {
        self.nested.lvl2.lvl3.value += 1;
    }
}