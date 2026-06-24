struct NestedStruct {
    x: Int;
    y: Int;
}

contract DeepNestedContract {
    p: NestedStruct;
    
    init() {
        self.p = NestedStruct{ x: 1, y: 2 };
    }
}