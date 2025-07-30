struct OptionalStruct {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalFieldsTest {
    optData: OptionalStruct;

    init() {
        self.optData = OptionalStruct{
            x: null,
            y: true,
            z: null,
        };
    }
}