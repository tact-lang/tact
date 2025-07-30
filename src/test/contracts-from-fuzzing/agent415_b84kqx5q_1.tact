struct NestedStruct {
    x: Int;
    y: Int?;
}

contract DeepOptionalTest {
    field: NestedStruct?;

    init() {
        self.field = null;
    }
}