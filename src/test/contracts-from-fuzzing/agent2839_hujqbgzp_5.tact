struct OptionalNest {
    value: Int?;
    flag: Bool?;
}

contract OptionalNestedFields {
    data1: OptionalNest;
    data2: OptionalNest;
    
    init() {
        self.data1 = OptionalNest{value: null, flag: true};
        self.data2 = OptionalNest{value: 5, flag: null};
    }
}