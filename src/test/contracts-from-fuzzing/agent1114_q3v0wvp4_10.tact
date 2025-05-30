struct OptionalStruct {
    x: Int?;
    y: Bool?;
}

contract OptionalOfOptionalStruct {
    data: OptionalStruct?;

    init() {
        self.data = null;
    }
}