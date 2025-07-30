struct NestedOptionalStruct {
    inner1: Int?;
    inner2: String?;
}

struct WrapperStruct {
    nested: NestedOptionalStruct;
    flag: Bool;
}

contract DepthOptionalFields {
    data: WrapperStruct;
    init() {
        self.data = WrapperStruct{
            nested: NestedOptionalStruct{
                inner1: null,
                inner2: null,
            },
            flag: true,
        };
    }
}