struct DeepNested {
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    nested: NestedInner;
}

struct NestedInner {
    value: Int?;
}

contract DeepTest {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            inner: InnerStruct{
                flag: true,
                nested: NestedInner{
                    value: 10,
                },
            },
        };
    }
}