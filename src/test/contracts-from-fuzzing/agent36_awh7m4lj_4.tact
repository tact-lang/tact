struct OptionalFieldTest {
    x: Int?;
    y: Bool?;
    txt: String?;
}

contract OptionalHolder {
    field: OptionalFieldTest;

    init() {
        self.field = OptionalFieldTest{
            x: null,
            y: true,
            txt: null
        };
    }
}
