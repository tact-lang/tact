struct InnerStruct { a: Int; b: Bool; }

contract TestNestedStruct {
    nested: InnerStruct;

    init() {
        self.nested = InnerStruct{ a: 1, b: true };
    }
}