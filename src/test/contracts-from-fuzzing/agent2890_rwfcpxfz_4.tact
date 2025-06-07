struct OptionalFields {
    x: Int?;
    y: Bool?;
    z: Address?;
}

contract OptionalStructTest {
    s: OptionalFields;

    init() {
        self.s = OptionalFields{
            x: null,
            y: true,
            z: null
        };
    }
}