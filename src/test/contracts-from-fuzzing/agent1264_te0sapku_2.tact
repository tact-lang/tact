struct NestedStruct {
    a: Int;
    b: Bool;
    optionalC: Cell?;
}

contract StructFieldTest {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{a: 1, b: true, optionalC: null};
    }
}
