struct NestedStruct {
    flag: Bool;
    num: Int;
    inner: InnerStruct;
}

struct InnerStruct {
    label: String;
    optFlag: Bool?;
}

contract WithNestedStruct {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            flag: true,
            num: 7,
            inner: InnerStruct{
                label: "test",
                optFlag: null,
            },
        };
    }
}
