struct DeepNested {
    inner: InnerStruct;
}

struct InnerStruct {
    x: Int;
    y: InnerMost;
}

struct InnerMost {
    flag: Bool;
    note: String;
}

contract DeeplyNestedStructs {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            inner: InnerStruct{
                x: 42,
                y: InnerMost{
                    flag: true,
                    note: "nested"
                }
            }
        };
    }
}