struct OptionalStruct {
    optInt: Int?;
    optBool: Bool?;
}

contract TestContract {
    optionalData: OptionalStruct;

    init() {
        self.optionalData = OptionalStruct{
            optInt: null,
            optBool: true,
        };
    }
}