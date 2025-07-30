struct OptionalStruct {
    name: String;
    maybeNumber: Int?;
    active: Bool?;
    note: String?;
}

contract OptionalsTest {
    info: OptionalStruct;

    init() {
        self.info = OptionalStruct{
            name: "",
            maybeNumber: null,
            active: null,
            note: null,
        };
    }
}