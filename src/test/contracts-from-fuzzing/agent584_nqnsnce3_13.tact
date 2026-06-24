struct TwoLevelNested {
    lvl1: Level1;
}

struct Level1 {
    lvl2: Level2;
}

struct Level2 {
    lvl3: Level3;
}

struct Level3 {
    x: Int;
    y: String;
    z: Bool;
}

contract Test {
    nest: TwoLevelNested = TwoLevelNested{
        lvl1: Level1{
            lvl2: Level2{
                lvl3: Level3{ x: 42, y: "deep", z: true }
            }
        }
    };
}