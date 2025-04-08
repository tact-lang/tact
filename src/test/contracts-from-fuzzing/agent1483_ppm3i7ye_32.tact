struct Level1 { val: Int }
struct Level2 { l1: Level1 }
struct Level3 { l2: Level2 }
struct Level4 { l3: Level3 }
struct Level5 { l4: Level4 }
struct Level6 { l5: Level5 }
struct Level7 { l6: Level6 }
struct Level8 { l7: Level7 }

contract Deep8Layers {
    d: Level8;

    init() {
        self.d = Level8 { l7: Level7 { l6: Level6 { l5: Level5 { l4: Level4 { l3: Level3 { l2: Level2 { l1: Level1 { val: 123 } } } } } } } };
    }
}