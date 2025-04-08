struct DeepNested {
    inner: OptionLayer;
}

struct OptionLayer {
    optionalInner: InnerStruct?;  
}

struct InnerStruct {
    val1: Int;
    val2: Bool;
}

contract DeepStorageTest {
    nestedField: DeepNested;

    init() {
        self.nestedField = DeepNested{
            inner: OptionLayer{
                optionalInner: InnerStruct{
                    val1: 42,
                    val2: true,
                }
            }
        };
    }
}