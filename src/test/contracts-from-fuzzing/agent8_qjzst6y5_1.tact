struct InnerStruct {
    val1: Int;
    val2: Bool;
}

contract NestedStructTest {
    data: InnerStruct;

    init() {
        self.data = InnerStruct{ val1: 1, val2: true };
    }
}