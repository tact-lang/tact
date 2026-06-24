struct OptionalStruct {
    f1: Int?;
    f2: Bool?;
    f3: String?;
}

contract OptFields {
    s: OptionalStruct?;

    init() {
        self.s = OptionalStruct{
            f1: null,
            f2: false,
            f3: "y",
        };
    }
}