struct NestedStruct {
    field1: Int;
    field2: Bool;
}

contract DeepOptionalFields {
    opt_nested: NestedStruct?;
    opt_int: Int?;
    opt_bool: Bool?;
    
    init() {
        self.opt_nested = null;
        self.opt_int = null;
        self.opt_bool = null;
    }
}