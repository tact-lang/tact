struct DeepNested {
    lvl1: Int;
    lvl2: MidStruct;
}

struct MidStruct {
    innerVal: Int;
    deep: InnerMost;
}

struct InnerMost {
    val1: Int;
    val2: Bool;
}

contract DeepNesting {
    storage: DeepNested;

    init() {
        self.storage = DeepNested{
            lvl1: 1,
            lvl2: MidStruct{
                innerVal: 2,
                deep: InnerMost{val1: 3, val2: true}
            }
        };
    }
}