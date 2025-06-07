struct NestedOpt {
    innerOpt: Int?;
}

contract PersistNestedOpt {
    value: NestedOpt?;
    
    init() {
        self.value = null;
    }
}