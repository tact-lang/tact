contract NestedOptionalInStruct {
    data: LevelOne;

    init() {
        self.data = LevelOne{
            nested: null
        };
    }
}

struct LevelOne {
    nested: LevelTwo?;
}

struct LevelTwo {
    value: Int?;
    desc: String?;
}
