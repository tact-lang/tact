struct NestedStruct {
    inner1: Int;
    inner2: Bool?;
}

contract DeepNestedTest {
    outer1: Int = 1;
    outer2: NestedStruct;

    init() {
        self.outer2 = NestedStruct{ inner1: 123, inner2: true };
    }
}