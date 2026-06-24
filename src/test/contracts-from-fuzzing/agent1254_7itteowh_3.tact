struct DeepNested {
    val1: Int;
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    text: String;
}

contract DeeplyNestedStruct {
    data: DeepNested;
    init() {
        self.data = DeepNested{
            val1: 10,
            inner: InnerStruct{
                flag: false,
                text: "deep",
            },
        };
    }
}