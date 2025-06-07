struct NestedStruct {
    x: Int;
    y: Bool;
}

contract NestedFieldTest {
    field: NestedStruct;

    init() {
        self.field = NestedStruct{ x: 10, y: true };
    }
}