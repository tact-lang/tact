struct NestedStruct {
    num: Int;
    flag: Bool;
    message: String;
}

contract NestedFieldContract {
    data: NestedStruct;
    
    init() {
        self.data = NestedStruct{
            num: 42,
            flag: true,
            message: "Hello"
        };
    }
}