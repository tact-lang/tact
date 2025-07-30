struct DeepNested {
    level1: Int;
    level2: NestedStruct;
}

struct NestedStruct {
    val: Bool;
}

contract DeepContract {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            level1: 5,
            level2: NestedStruct{ val: false }
        };
    }
}