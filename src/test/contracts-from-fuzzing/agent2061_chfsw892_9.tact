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

contract Nested4 {
    f: Level1;

    init() {
        self.f = Level1{
            l2: Level2{
                l3: Level3{
                    l4: Level4{ num: 911 }
                }
            }
        };
    }
}