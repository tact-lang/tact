struct NestedStruct {
    inner: Int;
    flag: Bool;
}

contract DeepNestedTest {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{ inner: 123, flag: true };
    }
}