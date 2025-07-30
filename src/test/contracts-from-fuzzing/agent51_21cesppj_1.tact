struct InnerStruct {
    a: Int;
    b: Bool;
}

contract DeeplyNestedTest {
    nested1: InnerStruct;
    nested2: InnerStruct;
    nested3: InnerStruct;

    init() {
        self.nested1 = InnerStruct{ a: 1, b: true };
        self.nested2 = InnerStruct{ a: 2, b: false };
        self.nested3 = InnerStruct{ a: 3, b: true };
    }
}