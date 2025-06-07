struct Level1 {
    a: Int;
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

contract DeepNested {
    receive() {
        let instance: Level5 = Level5 {
            l4: Level4 {
                l3: Level3 {
                    l2: Level2 {
                        l1: Level1 { a: 42 }
                    }
                }
            }
        };
        let value = instance.l4.l3.l2.l1.a;
    }
}
