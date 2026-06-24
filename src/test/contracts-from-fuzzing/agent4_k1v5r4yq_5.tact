struct Level1 {
    value: Int;
}

struct Level2 {
    level1: Level1;
}

struct Level3 {
    level2: Level2;
}

struct Level4 {
    level3: Level3;
}

struct Level5 {
    level4: Level4;
}

contract TestDeepNesting {
    receive() {
        let l1: Level1 = Level1 { value: 10 };
        let l2: Level2 = Level2 { level1: l1 };
        let l3: Level3 = Level3 { level2: l2 };
        let l4: Level4 = Level4 { level3: l3 };
        let l5: Level5 = Level5 { level4: l4 };
        let result: Int = l5.level4.level3.level2.level1.value;
    }
}
