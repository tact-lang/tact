struct Level10 { value: Int; }
struct Level9  { nested: Level10; }
struct Level8  { nested: Level9; }
struct Level7  { nested: Level8; }
struct Level6  { nested: Level7; }
struct Level5  { nested: Level6; }
struct Level4  { nested: Level5; }
struct Level3  { nested: Level4; }
struct Level2  { nested: Level3; }
struct Level1  { nested: Level2; }

contract TestDeepNested {
    receive() {
        let l10: Level10 = Level10 { value: 42 };
        let l9: Level9 = Level9 { nested: l10 };
        let l8: Level8 = Level8 { nested: l9 };
        let l7: Level7 = Level7 { nested: l8 };
        let l6: Level6 = Level6 { nested: l7 };
        let l5: Level5 = Level5 { nested: l6 };
        let l4: Level4 = Level4 { nested: l5 };
        let l3: Level3 = Level3 { nested: l4 };
        let l2: Level2 = Level2 { nested: l3 };
        let l1: Level1 = Level1 { nested: l2 };
        let result: Int = l1.nested.nested.nested.nested.nested.nested.nested.nested.nested.value;
    }
}
