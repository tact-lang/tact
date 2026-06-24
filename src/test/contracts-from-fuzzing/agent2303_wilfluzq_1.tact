struct NestedStruct {
    innerVal: Int;
    optInner: Int?;
}

contract DeepNestedTest {
    val: Int = 1;
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{
            innerVal: 42,
            optInner: null,
        };
    }
}
