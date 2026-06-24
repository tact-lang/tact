struct NestedStruct {
    inner_val: Int;
    optional_val: Bool?;
}

contract DeepNestedContract {
    nested: NestedStruct;
    
    init() {
        self.nested = NestedStruct{ inner_val: 1, optional_val: null };
    }
}