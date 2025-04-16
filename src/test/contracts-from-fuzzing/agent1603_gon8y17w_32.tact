struct OptionalDefaultStruct {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptDefTest {
    s: OptionalDefaultStruct;

    init() {
        self.s = OptionalDefaultStruct{};
    }
}