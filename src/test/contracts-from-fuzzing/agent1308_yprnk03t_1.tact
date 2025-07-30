struct NestedOpt {
    innerOpt: Int?;
}

contract TestContract {
    nested: NestedOpt?;
    
    init() {
        self.nested = null;
    }
}