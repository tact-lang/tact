struct Level3 {
    val3: Int;
}

struct Level2 {
    lvl3a: Level3;
    lvl3b: Level3;
}

struct Level1 {
    lvl2a: Level2;
    lvl2b: Level2;
}

contract NestedMultiBranches {
    state: Level1;

    init() {
        self.state = Level1{
            lvl2a: Level2{
                lvl3a: Level3{val3: 100},
                lvl3b: Level3{val3: 101}
            },
            lvl2b: Level2{
                lvl3a: Level3{val3: 200},
                lvl3b: Level3{val3: 201}
            }
        };
    }
}
