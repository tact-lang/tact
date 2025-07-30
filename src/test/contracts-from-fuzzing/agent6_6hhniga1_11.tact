struct OptInDeepNested {
    lvl1: Level1?;
}

struct Level1 {
    lvl2: Level2?;
}

struct Level2 {
    lvl3: Level3?;
}

struct Level3 {
    x: Int;
    y: Bool;
}

contract TestContract {
    s: OptInDeepNested;

    init() {
        self.s = OptInDeepNested{
            lvl1: Level1{
                lvl2: Level2{
                    lvl3: null
                }
            }
        };
    }
}
