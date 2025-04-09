struct DeepLevel3 {
    comment: String?;
}

struct DeepLevel2 {
    level3: DeepLevel3;
}

struct DeepLevel1 {
    level2: DeepLevel2;
}

contract SparseDeepNest {
    deepNested: DeepLevel1;

    init() {
        self.deepNested = DeepLevel1{
            level2: DeepLevel2{
                level3: DeepLevel3{
                    comment: null
                }
            }
        };
    }
}