struct NestedStruct {
    x: Int;
    y: Int?;
}

contract DeepStorageTest {
    mainField: NestedStruct;
    
    init() {
        self.mainField = NestedStruct{ x: 10, y: null };
    }
}