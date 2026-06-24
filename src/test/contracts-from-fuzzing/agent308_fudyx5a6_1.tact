struct DeeplyNested {
    inner: OptionalLayer;
}

struct OptionalLayer {
    value: NestedStruct?;
}

struct NestedStruct {
    flag: Bool;
    number: Int;
}

contract StorageTest {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            inner: OptionalLayer{
                value: NestedStruct{
                    flag: true,
                    number: 42,
                }
            }
        };
    }
}
