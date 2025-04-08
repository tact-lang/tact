struct NestedStruct {
    inner: InnerStruct;
    flag: Bool;
    count: Int;
}

struct InnerStruct {
    x: Int;
    y: Bool;
}

contract DeepNested {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            inner: InnerStruct{
                x: 5,
                y: false,
            },
            flag: true,
            count: 42,
        };
    }
}