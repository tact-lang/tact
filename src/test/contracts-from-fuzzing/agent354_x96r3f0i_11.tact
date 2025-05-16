struct DeepNested {
    level2: Level2;
}
struct Level2 {
    level3: Level3;
}
struct Level3 {
    level4: Level4;
}
struct Level4 {
    finalVal: Int;
}

contract DeepHierarchicalStruct {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            level2: Level2{
                level3: Level3{
                    level4: Level4{
                        finalVal: 123
                    }
                }
            }
        };
    }
}
