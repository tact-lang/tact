struct InnerStruct {
    x: Int;
    y: Int?;
}

contract DeepNestedTest {
    s: InnerStruct;

    init() {
        self.s = InnerStruct{ x: 1, y: null };
    }
}