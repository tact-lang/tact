contract TestContract {
    nested: NestedStruct;

    init() {
        self.nested = NestedStruct{
            inner: InnerStruct{
                x: 1,
                y: 2,
                optZ: null,
            },
            flag: false,
            message: "hi",
        };
    }
}

struct NestedStruct {
    inner: InnerStruct;
    flag: Bool;
    message: String;
}

struct InnerStruct {
    x: Int;
    y: Int as uint16;
    optZ: Int?;
}
