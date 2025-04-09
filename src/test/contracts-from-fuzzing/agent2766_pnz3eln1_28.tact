struct OptionalInStruct {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalStructFields {
    state: OptionalInStruct;

    init() {
        self.state = OptionalInStruct{
            x: null,
            y: null,
            z: null,
        };
    }
}