struct Level1 {
    l2: Level2;
}

struct Level2 {
    l3: Level3;
}

struct Level3 {
    l4: Level4;
}

struct Level4 {
    l5: Level5;
}

struct Level5 {
    val: Int;
}

contract VeryDeep {
    root: Level1;

    init() {
        self.root = Level1{
            l2: Level2{
                l3: Level3{
                    l4: Level4{
                        l5: Level5{
                            val: 42
                        }
                    }
                }
            }
        };
    }
}