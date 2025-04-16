struct OptionalBoolStruct {
    flag: Bool?;
}

contract TestOptionalBool {
    data: OptionalBoolStruct;

    init() {
        self.data = OptionalBoolStruct{
            flag: null
        };
    }
}