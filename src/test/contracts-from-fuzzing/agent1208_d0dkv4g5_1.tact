struct NestedStruct {
    value: Int;
    flag: Bool;
}

contract TestContract {
    data: NestedStruct;
    
    init() {
        self.data = NestedStruct{ value: 5, flag: true };
    }
}