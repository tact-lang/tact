struct OptionalBoolStruct {
    flag: Bool?;
}

contract OptionalBoolContract {
    data: OptionalBoolStruct;

    init() {
        self.data = OptionalBoolStruct{
            flag: null
        };
    }
}