struct NestedStruct {
    val1: Int;
    val2: Bool;
}

contract Test {
    s: NestedStruct;

    init() {
        self.s = NestedStruct{ val1: 1, val2: true };
    }
}