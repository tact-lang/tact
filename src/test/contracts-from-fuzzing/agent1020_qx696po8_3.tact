struct OptionalFields {
    name: String = "fuzz";
    age: Int?;
    flag: Bool?;
}

contract OptionalStructTest {
    opts: OptionalFields;

    init() {
        self.opts = OptionalFields{};
    }
}