struct Level3 {
    flag: Bool;
}

struct Level2 {
    lvl3: Level3;
    optInt: Int?;
}

struct Level1 {
    lvl2: Level2;
}

contract MultiLevelNested {
    nested: Level1;

    init() {
        self.nested = Level1{
            lvl2: Level2{
                lvl3: Level3{flag: true},
                optInt: null,
            }
        };
    }
}