struct OptionalStruct {
    x: Int?;
    y: String?;
}

contract OptFields {
    os: OptionalStruct;

    init() {
        self.os = OptionalStruct{ x: null, y: null };
    }
}