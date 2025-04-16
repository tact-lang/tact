struct DeepOptional {
    opt: Int?;
}

struct DeepLevel2 {
    lvl1: DeepOptional?;
}

contract NestedOptionalStruct {
    deep: DeepLevel2;

    init() {
        self.deep = DeepLevel2{ lvl1: null };
    }
}