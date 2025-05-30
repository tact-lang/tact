struct NestedOpt {
    innerOpt: Int?;
}

contract TestStorage {
    nested: NestedOpt;
    
    init() {
        self.nested = NestedOpt{ innerOpt: null };
    }
}