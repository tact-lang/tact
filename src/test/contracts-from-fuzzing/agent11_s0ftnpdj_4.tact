struct Level1 { a: Int; }
struct Level2 { l1: Level1; }
struct Level3 { l2: Level2; }
struct Level4 { l3: Level3; }
struct Level5 { l4: Level4; }

contract TestDeepNested {
    receive() {
        let level1 = Level1 { a: 1 };
        let level2 = Level2 { l1: level1 };
        let level3 = Level3 { l2: level2 };
        let level4 = Level4 { l3: level3 };
        let level5 = Level5 { l4: level4 };
        level5.l4.l3.l2.l1.a;
    }
}
