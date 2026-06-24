struct Level1 { val: Int; }
struct Level2 { val: Level1; }
struct Level3 { val: Level2; }
struct Level4 { val: Level3; }
struct Level5 { val: Level4; }
struct Level6 { val: Level5; }
struct Level7 { val: Level6; }

contract SevenDeep {
    nest: Level7;

    init() {
        self.nest = Level7{ val: Level6{ val: Level5{ val: Level4{ val: Level3{ val: Level2{ val: Level1{ val: 100 } } } } } } };
    }
}