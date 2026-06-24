struct OptInOpt {
    nested: InnerStruct?;
}

struct InnerStruct {
    value: Int?;
}

contract NestedOptOpt {
    data: OptInOpt;
    
    init() {
        self.data = OptInOpt{
            nested: null,
        };
    }
}