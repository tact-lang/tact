struct Level3 {
    value: Int;
}

struct Level2 {
    lvl3: Level3?;
}

struct Level1 {
    lvl2A: Level2;
    lvl2B: Level2?;
}

contract MultiOptionalDeep {
    val: Level1;
    
    init() {
        self.val = Level1{
            lvl2A: Level2 {
                lvl3: null
            },
            lvl2B: null
        };
    }
}