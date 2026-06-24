struct Level3 {
    x: Int;
}

struct Level2 {
    lvl3a: Level3;
    lvl3b: Level3;
}

struct Level1 {
    lvl2a: Level2;
    lvl2b: Level2;
}

contract MultiNested {
    state: Level1;

    init() {
        self.state = Level1{
            lvl2a: Level2{
                lvl3a: Level3{x: 1},
                lvl3b: Level3{x: 2}
            },
            lvl2b: Level2{
                lvl3a: Level3{x: 3},
                lvl3b: Level3{x: 4}
            }
        };
    }
}