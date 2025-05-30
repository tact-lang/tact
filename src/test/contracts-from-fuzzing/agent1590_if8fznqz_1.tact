struct NestedStruct {
    flag: Bool;
    count: Int;
    comment: String;
}

contract TestContract {
    data: NestedStruct;
    
    init() {
        self.data = NestedStruct{
            flag: true,
            count: 42,
            comment: "Hello"
        };
    }
}