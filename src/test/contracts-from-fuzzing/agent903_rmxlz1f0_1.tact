struct NestedStruct {
    inner1: Int;
    inner2: Bool;
}

contract DeepNestedTest {
    ns: NestedStruct;

    init() {
        self.ns = NestedStruct{ inner1: 42, inner2: true };
    }
}