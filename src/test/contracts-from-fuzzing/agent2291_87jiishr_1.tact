struct NestedStruct {
    flag: Bool;
    data: Int?;
    label: String;
}

contract DeepNestedStorage {
    info: NestedStruct;
    initializer: Int = 1;
    
    init() {
        self.info = NestedStruct{
            flag: true,
            data: null,
            label: "test"
        };
    }
}
