struct NestedStruct {
    inner1: Int;
    inner2: Bool;
}

contract DeepNestedContract {
    nestedField: NestedStruct; 
    
    init() {
        self.nestedField = NestedStruct{inner1: 1, inner2: true};
    }
}