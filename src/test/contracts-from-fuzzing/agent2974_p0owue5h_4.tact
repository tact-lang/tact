struct OptionalStruct {
    optInt: Int?;
    optBool: Bool?;
}

contract TestContract {
    x: OptionalStruct;

    init() {
        self.x = OptionalStruct{
            optInt: null,
            optBool: true,
        };
    }
}