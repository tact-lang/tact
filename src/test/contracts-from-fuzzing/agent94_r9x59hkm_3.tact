struct OptionalStruct {
    info: String?;
    flag: Bool;
}

contract OptionalFieldStructTest {
    data: OptionalStruct?;

    init() {
        self.data = null;
    }
}