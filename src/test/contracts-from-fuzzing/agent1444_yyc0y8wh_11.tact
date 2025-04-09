struct NestedOptInStruct {
    a: Int?;
    b: Bool?;
    c: InnerStruct?;
}

struct InnerStruct {
    x: Bool;
    y: Int;
}

contract ContractWithNesting {
    field: NestedOptInStruct;
    init() {
        self.field = NestedOptInStruct{
            a:null,
            b:null,
            c:null
        };
    }
}
