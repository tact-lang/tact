struct NestedStruct {
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    count: Int;
    label: String;
}

contract NestedHolder {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            inner: InnerStruct{
                flag: true,
                count: 42,
                label: "test"
            }
        };
    }
}