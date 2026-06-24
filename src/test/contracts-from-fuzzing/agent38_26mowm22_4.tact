struct OptionalStruct {
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
}

contract TestContract {
    os: OptionalStruct;
    init() {
        self.os = OptionalStruct{
            opt1: null,
            opt2: true,
            opt3: null
        };
    }
}
