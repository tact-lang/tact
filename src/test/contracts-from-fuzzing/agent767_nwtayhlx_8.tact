struct Level4 {
    a: Int;
    b: Bool;
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

contract DeepNestTest {
    data: Level1;

    init() {
        self.data = Level1{
            l2: Level2{
                l3: Level3{
                    l4: Level4{
                        a: 42,
                        b: true
                    }
                }
            }
        };
    }
}
