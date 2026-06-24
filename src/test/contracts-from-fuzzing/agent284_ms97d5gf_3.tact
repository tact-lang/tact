struct OptionalStruct {
    a: Int?;
    b: Bool?;
}

contract OptionalTest {
    optData: OptionalStruct;

    init() {
        self.optData = OptionalStruct{};
    }
}