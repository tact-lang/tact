struct OptionalFields {
    x: Int?;
    y: Bool?;
    s: String?;
}

contract OptionalStructTest {
    data: OptionalFields;

    init() {
        self.data = OptionalFields{
            x: null,
            y: true,
            s: null,
        };
    }
}