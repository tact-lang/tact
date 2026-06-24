struct OptionalTestStruct {
    x: Int?;
    y: Bool?;
    z: String?;
    w: Int;
}

contract OptionalFields {
    data: OptionalTestStruct;

    init() {
        self.data = OptionalTestStruct{
            x: null,
            y: true,
            z: null,
            w: 1234,
        };
    }
}