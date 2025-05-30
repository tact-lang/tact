struct ComplexDepth {
    flag1: Bool?;
    flag2: Bool;
    level2: LevelTwo;
}

struct LevelTwo {
    num: Int;
    innerOpt: InnerOptStruct;
}

struct InnerOptStruct {
    deepFlag: Bool?;
    deepVal: Int?;
}

contract DeeplyNestedOptionals {
    field: ComplexDepth;

    init() {
        self.field = ComplexDepth{
            flag1: null,
            flag2: true,
            level2: LevelTwo{
                num: 7,
                innerOpt: InnerOptStruct{
                    deepFlag: false,
                    deepVal: null,
                }
            }
        };
    }
}