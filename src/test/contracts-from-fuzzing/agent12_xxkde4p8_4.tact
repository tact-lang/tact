struct Level5 {
    a: Int;
}

struct Level4 {
    l5: Level5;
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

contract TestDeepNested {
    receive() {
        let s: Level1 = Level1 {
            l2: Level2 {
                l3: Level3 {
                    l4: Level4 {
                        l5: Level5 { a: 999 }
                    }
                }
            }
        };
        s.l2.l3.l4.l5.a;
    }
}
