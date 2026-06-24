struct NestedStruct {
    field1: Int;
    field2: Bool;
}

contract TestContract {
    myField: NestedStruct;
    
    init() {
        self.myField = NestedStruct{field1: 1, field2: true};
    }
}