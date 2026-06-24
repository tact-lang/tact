struct DeepNested {
    inner: InnerStruct;
}

struct InnerStruct {
    val1: Int;
    val2: Int?;
    val3: Bool;
}

contract TestContract {
    nestedField: DeepNested;

    init() {
        self.nestedField = DeepNested{
            inner: InnerStruct{
                val1: 1,
                val2: null,
                val3: true,
            },
        };
    }
}