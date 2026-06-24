struct OptionalStruct {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalStructFields {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            x: null,
            y: null,
            z: null
        };
    }
}