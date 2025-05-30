struct OptionalStructs {
    one: Int?;
    two: Bool?;
    three: String?;
}

contract OptStructTest {
    store: OptionalStructs?;

    init() {
        self.store = OptionalStructs{
            one: 1,
            two: null,
            three: null
        };
    }
}