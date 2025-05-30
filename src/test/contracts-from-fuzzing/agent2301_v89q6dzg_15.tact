struct NestedOptStruct {
    optNested: Inner?;
}

struct Inner {
    a: Int?;
    b: Bool?;
}

contract ContractDeepOpt {
    state: NestedOptStruct;
    init() {
        self.state = NestedOptStruct{
            optNested: Inner{ a: null, b: null }
        };
    }
}