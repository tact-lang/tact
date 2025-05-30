struct DeepOptionalStruct {
    level1: Int?;
    level2: Int?;
    level3: Int?;
    level4: Int?;
    level5: Int?;
    level6: Int?;
    level7: Int?;
    level8: Int?;
    level9: Int?;
    level10: Int?;
}

contract LotsOfOptStruct {
    val: DeepOptionalStruct;

    init() {
        self.val = DeepOptionalStruct{
            level1: null,
            level2: null,
            level3: null,
            level4: null,
            level5: null,
            level6: null,
            level7: null,
            level8: null,
            level9: null,
            level10: null,
        };
    }
}