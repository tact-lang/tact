struct InnerLevel3 {
    val: Int;
}

struct InnerLevel2 {
    lvl3: InnerLevel3;
}

struct InnerLevel1 {
    lvl2: InnerLevel2;
}

struct RootStruct {
    optLvl1: InnerLevel1?;
}

contract NestedOptionalDeep {
    data: RootStruct;

    init() {
        self.data = RootStruct{
            optLvl1: null,
        };
    }
}
