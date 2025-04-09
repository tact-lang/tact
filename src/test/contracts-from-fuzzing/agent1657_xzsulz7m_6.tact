struct OptionalStruct {
    optInt: Int?;
    optBool: Bool?;
    optAddress: Address?;
}

contract TestContract {
    data: OptionalStruct;
    init() {
        self.data = OptionalStruct{
            optInt: null,
            optBool: true,
            optAddress: null
        };
    }
}