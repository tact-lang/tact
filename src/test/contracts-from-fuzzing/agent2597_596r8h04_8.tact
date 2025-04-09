struct OptionalStruct {
    x: Int?;
    y: String?;
    z: Bool?;
}

contract OptFields {
    storage: OptionalStruct;

    init() {
        self.storage = OptionalStruct{
            x: null,
            y: null,
            z: null,
        };
    }
}