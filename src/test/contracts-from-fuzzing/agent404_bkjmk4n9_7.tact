struct Level3 {
    deep: Int;
    optDeep: Int?;
    txt: String;
}

struct Level2 {
    lvl3: Level3;
    optLvl3: Level3?;
    note: String;
}

struct Level1 {
    lvl2: Level2;
    optLvl2: Level2?;
    description: String;
}

contract NestedTree {
    root: Level1;

    init() {
        self.root = Level1{
            lvl2: Level2{
                lvl3: Level3{deep: 1, optDeep: null, txt: "a"},
                optLvl3: null,
                note: "note",
            },
            optLvl2: null,
            description: "desc",
        };
    }
}