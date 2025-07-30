struct DeeplyNested {
    inner: InnerStruct;
}

struct InnerStruct {
    val1: Bool;
    val2: Int;
    val3: Bool?;
}

contract TestContract {
    nested: DeeplyNested;

    init() {
        self.nested = DeeplyNested{
            inner: InnerStruct{
                val1: true,
                val2: 123,
                val3: null,
            },
        };
    }
}