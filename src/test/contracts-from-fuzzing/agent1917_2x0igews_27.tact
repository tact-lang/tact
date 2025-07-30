struct Level1 {
    f: Int;
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

contract VeryDeepNested {
    foo: Level4;

    init() {
        self.foo = Level4{
            l3: Level3{
                l2: Level2{
                    l1: Level1{
                        f: 123
                    }
                }
            }
        };
    }
}
