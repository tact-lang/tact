struct NestedStruct {
    x: Int;
    y: Int?;
}

contract StorageTest {
    info: NestedStruct;
    
    init() {
        self.info = NestedStruct{
            x: 1,
            y: null,
        };
    }
}