struct OptionalStruct {
    x: Int?;
    y: Bool?;
    s: String?;
}

contract TestContract {
    optionalVal: OptionalStruct;

    init() {
        self.optionalVal = OptionalStruct{
            x: null,
            y: true,
            s: null
        };
    }
}