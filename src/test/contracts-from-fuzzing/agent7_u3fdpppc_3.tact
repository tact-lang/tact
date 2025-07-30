struct VeryDeepNested {
    level4: String;
}

struct Level3 {
    level4Obj: VeryDeepNested;
}

struct Level2 {
    level3Obj: Level3;
}

struct Level1 {
    level2Obj: Level2;
}

contract DeepStorage {
    nested: Level1;

    init() {
        self.nested = Level1{
            level2Obj: Level2{
                level3Obj: Level3 {
                    level4Obj: VeryDeepNested { level4: "end" }
                }
            }
        };
    }
}