struct OptionalStruct {
    a: Int?;
    b: Bool?;
    s: String?;
}

contract TestContract {
    optField: OptionalStruct?;

    init() {
        self.optField = OptionalStruct{
            a: null,
            b: false,
            s: ""
        };
    }
}