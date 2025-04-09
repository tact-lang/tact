struct OptionalStruct {
    x: Int?;
    y: Bool?;
}

contract OptionalFields {
    a: OptionalStruct?;

    init() {
        self.a = null;
    }
}