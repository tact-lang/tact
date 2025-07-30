struct OptionalNested {
    one: Int?;
    two: Bool?;
    three: String?;
}

contract OptionalNestedStorage {
    data: OptionalNested?;

    init() {
        self.data = OptionalNested{
            one: null,
            two: null,
            three: "hey",
        };
    }
}