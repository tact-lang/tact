struct Level1 { a: Int; }
struct Level2 { l1: Level1; }
struct Level3 { l2: Level2; }
struct Level4 { l3: Level3; }
struct Level5 { l4: Level4; }
struct Level6 { l5: Level5; }
struct Level7 { l6: Level6; }

contract Deep7 {
    val: Level7;
    init() {
        self.val = Level7{ l6: Level6 { l5: Level5 { l4: Level4 { l3: Level3 { l2: Level2 { l1: Level1 { a:42 } } } } } } };
    }
}