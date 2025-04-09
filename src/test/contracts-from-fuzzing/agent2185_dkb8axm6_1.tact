struct InnerStruct {
    foo: Int;
    bar: Bool;
}

contract DeepNestTest {
    nested: InnerStruct;

    init() {
        self.nested = InnerStruct{ foo: 5, bar: true };
    }
}