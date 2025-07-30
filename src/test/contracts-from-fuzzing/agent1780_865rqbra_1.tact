struct DeepNested {
    inner: InnerStruct;
}

struct InnerStruct {
    optionalInner: Innermost?;
}

struct Innermost {
    value: Int;
}

contract StorageTest {
    nested: DeepNested;

    init() {
        self.nested = DeepNested{
            inner: InnerStruct{
                optionalInner: Innermost{value: 42}
            }
        };
    }
}