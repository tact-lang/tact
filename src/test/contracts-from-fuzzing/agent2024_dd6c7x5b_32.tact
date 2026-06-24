struct LevelTwoOpt {
    x: Int?;
    b: Bool?;
}

struct LevelOneOpt {
    nested: LevelTwoOpt?;
}

contract OptNestedStruct {
    data: LevelOneOpt;

    init() {
        self.data = LevelOneOpt{
            nested: null
        };
    }
}