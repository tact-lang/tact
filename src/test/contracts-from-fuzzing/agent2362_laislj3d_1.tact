struct InnerStruct {
    f1: Int;
    f2: Bool;
    f3: String;
}

contract TestContract {
    exampleField: InnerStruct;
    
    init() {
        self.exampleField = InnerStruct{
            f1: 1,
            f2: true,
            f3: "test"
        };
    }
}