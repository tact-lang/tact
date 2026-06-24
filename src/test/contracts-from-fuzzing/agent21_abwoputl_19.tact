struct Level4 {
    num: Int;
}

struct Level3 {
    l4: Level4;
}

struct Level2 {
    l3: Level3;
}

struct Level1 {
    l2: Level2;
}

contract FourDeep {
    data: Level1;

    init() {
        self.data = Level1{
            l2: Level2{
                l3: Level3{
                    l4: Level4{ num: 123 }
                }
            }
        };
    }
}
