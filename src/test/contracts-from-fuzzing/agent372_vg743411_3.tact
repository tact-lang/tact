struct Level3 {
    data: String;
}

struct Level2 {
    lvl3: Level3;
}

struct Level1 {
    lvl2: Level2;
}

contract Test {
    nested: Level1;
    init() {
        self.nested = Level1{
            lvl2: Level2{
                lvl3: Level3{
                    data: "deep"
                }
            }
        };
    }
}