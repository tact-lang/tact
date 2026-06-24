struct NestedStruct {
    flag: Bool;
    count: Int;
}

contract DeepOptionals {
    record: NestedStruct?;
    
    init() {
        self.record = null;
    }
}