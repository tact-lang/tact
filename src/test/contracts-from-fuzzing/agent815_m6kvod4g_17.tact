struct OptionalStruct {
    val: Int?;
    flag: Bool?;
}

contract OptionalStructField {
    foo: OptionalStruct?;
    
    init() {
        self.foo = OptionalStruct{ val: 5, flag: false };
    }
}