struct InnerStruct {
    value1: Int;
    value2: Int;
    opt_bool: Bool?;
    name: String;
}

contract ManyPrimitiveTypes {
    data: InnerStruct;
    init() {
        self.data = InnerStruct{value1: 1, value2: 2, opt_bool: null, name: "test"};
    }
}