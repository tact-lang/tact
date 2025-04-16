struct NestedStruct {
    val1: Int;
    val2: Bool;
}

contract DeepPersist {
    nested: NestedStruct;
    num: Int = 5;

    init() {
        self.nested = NestedStruct{ val1: 42, val2: true };
        self.num = 55;
    }
}