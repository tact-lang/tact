struct NestedOptional {
    inner: InnerOpt?; 
}

struct InnerOpt {
    flag: Bool;
    note: String?; 
}

contract ContractOpt {
    state: NestedOptional;

    init() {
        self.state = NestedOptional{
            inner: null
        };
    }
}
