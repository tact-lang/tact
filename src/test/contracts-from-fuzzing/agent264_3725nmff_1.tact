struct NestedStruct {
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    count: Int as uint32;
    text: String;
}

contract DeepStorage {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            inner: InnerStruct{
                flag: true,
                count: 123,
                text: "hello",
            }
        };
    }
}
