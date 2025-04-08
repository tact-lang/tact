struct NestedStruct {
    flag: Bool;
    value: Int;
    text: String;
}

contract NestedStructStorage {
    data: NestedStruct;
    
    init() {
        self.data = NestedStruct{
            flag: true,
            value: 17,
            text: "hi"
        };
    }
}