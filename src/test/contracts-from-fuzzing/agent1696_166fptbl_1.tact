struct NestedStruct {
    val1: Int;
    val2: Bool?;
}

contract TestContract {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{ val1: 1, val2: true };
    }
}