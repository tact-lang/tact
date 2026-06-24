struct NestedStruct {
    inner1: Int;
    inner2: Bool?;
}

contract DeepNestedContract {
    myField: NestedStruct;
    
    init() {
        self.myField = NestedStruct{
            inner1: 5,
            inner2: true
        };
    }
}