struct NestedStruct {
    field1: Int;
    field2: Bool;
}

contract TestContract {
    nestedOpt: NestedStruct?;
    
    init() {
        self.nestedOpt = null;
    }
}