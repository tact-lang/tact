struct OptsStruct {
    a: Int?;
    b: Bool?;
}

contract WithOptField {
    value: OptsStruct;
    init() {
        self.value = OptsStruct{ a: null, b: null };
    }
}