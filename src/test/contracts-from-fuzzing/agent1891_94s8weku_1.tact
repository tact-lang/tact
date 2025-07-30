struct InnerStruct { x: Int; y: Int; }

contract NestedStructTest {
    nested: InnerStruct;

    init() {
        self.nested = InnerStruct{ x: 1, y: 2 };
    }
}