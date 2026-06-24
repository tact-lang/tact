struct NestedOptionalStruct {
    s: InnerOptStruct?;
}

struct InnerOptStruct {
    x: Int?;
    y: Bool?;
}

contract ContractWithNestedOptionalStruct {
    data: NestedOptionalStruct;

    init() {
        self.data = NestedOptionalStruct{
            s: InnerOptStruct{
                x: 123,
                y: false,
            },
        };
    }
}