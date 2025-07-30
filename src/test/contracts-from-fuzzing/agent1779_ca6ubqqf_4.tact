struct InnerStruct {
    value: Int;
    opt_val: Int?;
}

contract OptionalInStruct {
    field: InnerStruct;
    init() {
        self.field = InnerStruct{value: 0, opt_val: null};
    }
}