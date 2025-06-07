struct DeepNested {
    inner: InnerStruct;
}

struct InnerStruct {
    foo: Bool;
    bar: InnerMost;
}

struct InnerMost {
    value: String;
    flag: Bool?;
}

contract TestManyNested {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            inner: InnerStruct{
                foo: true,
                bar: InnerMost{
                    value: "abc",
                    flag: false,
                },
            },
        };
    }
}
