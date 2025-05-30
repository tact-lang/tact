struct NestedStruct {
    inner: InnerStruct;
}

struct InnerStruct {
    value: Int;
    flag: Bool;
    text: String;
    optionalValue: Int?;
}

contract TestContract {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            inner: InnerStruct{
                value: 42,
                flag: true,
                text: "hello",
                optionalValue: null,
            }
        };
    }
}