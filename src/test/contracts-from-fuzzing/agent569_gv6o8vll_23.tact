struct OptionalBoolStruct {
    flag: Bool?;
}

contract BoolOptInStruct {
    val: OptionalBoolStruct;
    init() {
        self.val = OptionalBoolStruct{flag:null};
    }
}