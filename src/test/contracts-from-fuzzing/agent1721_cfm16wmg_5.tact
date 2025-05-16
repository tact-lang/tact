struct OptionalStruct {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalTester {
    data: OptionalStruct;
    init() {
        self.data = OptionalStruct{
            x: null,
            y: true,
            z: null,
        };
    }
}