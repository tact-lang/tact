struct DeepNestedOption {
    value: Int?;
}

contract ContractOptOpt {
    foo: DeepNestedOption?;
    
    init() {
        self.foo = null;
    }
}