struct CrazyNesting {
    lvl1: Lvl1;
}

struct Lvl1 {
    lvl2: Lvl2;
}

struct Lvl2 {
    lvl3: Lvl3;
}

struct Lvl3 {
    lvl4: Lvl4;
}

struct Lvl4 {
    x: Int;
}

contract InsaneDepth {
    c: CrazyNesting;

    init() {
        self.c = CrazyNesting{
            lvl1: Lvl1{
                lvl2: Lvl2{
                    lvl3: Lvl3{
                        lvl4: Lvl4{ x: 999 }
                    }
                }
            }
        };
    }
}