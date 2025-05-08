struct OptStruct {
    field1: Int?;
    field2: Bool?;
    nested: NestedOpt?;
}

struct NestedOpt {
    subfield: String?;
}

contract TestOpt {
    opt: OptStruct;

    init() {
        self.opt = OptStruct{
            field1: null,
            field2: true,
            nested: NestedOpt{
                subfield: null
            }
        };
    }
}