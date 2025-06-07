struct NestedStruct {
    x: Int;
    y: Bool;
    z: String;
}

contract ContractWithNested {
    data: NestedStruct;
    
    init() {
        self.data = NestedStruct{
            x: 10,
            y: false,
            z: "test"
        };
    }
}