struct InnerStruct {
    value: Int;
    flag: Bool;
}

contract NestedStructContract {
    data: InnerStruct;
    
    init() {
        self.data = InnerStruct{ value: 123, flag: true };
    }
}