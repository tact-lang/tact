struct Level1 {
    val: Int;
}

struct Level2 {
    l1: Level1;
}

struct Level3 {
    l2: Level2;
}

struct Level4 {
    l3: Level3;
}

struct Level5 {
    l4: Level4;
}

contract FullDepth {
    deep: Level5 = Level5{
        l4: Level4{
            l3: Level3{
                l2: Level2{
                    l1: Level1{val: 99}
                }
            }
        }
    };

    init() {
        self.deep = Level5{
            l4: Level4{
                l3: Level3{
                    l2: Level2{
                        l1: Level1{val: 77}
                    }
                }
            }
        };
    }
}