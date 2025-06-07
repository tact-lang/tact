struct InnerStruct {
    alpha: Int;
    beta: Bool;
    gamma: String;
}

contract StructInStorage {
    nested: InnerStruct;
    
    init() {
        self.nested = InnerStruct{
            alpha: 123,
            beta: true,
            gamma: "test"
        };
    }
}