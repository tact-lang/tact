struct NestedStruct {
    val1: Int;
    val2: Bool;
}

contract NestedStructContract {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{ val1: 123, val2: false };
    }
}