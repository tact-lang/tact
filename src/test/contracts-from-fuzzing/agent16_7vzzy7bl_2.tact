struct NestedStruct {
    a: Int;
    b: Int?;
}

contract NestedFieldTest {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{
            a: 1,
            b: null,
        };
    }
}