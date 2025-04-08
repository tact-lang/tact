struct DeepNested {
    a: Int;
    b: NestedStruct;
}

struct NestedStruct {
    i: Int;
    inner: InnerStruct;
}

struct InnerStruct {
    name: String;
    flag: Bool;
}

contract TestContract {
    deep: DeepNested;
    init() {
        self.deep = DeepNested{
            a: 5,
            b: NestedStruct{
                i: 10,
                inner: InnerStruct{
                    name: "hello",
                    flag: false,
                },
            },
        };
    }
}