struct DefaultedFields {
    x: Int = 10;
    y: Bool = false;
    s: String = "test";
}

contract HasDefaults {
    df: DefaultedFields;

    init() {
        self.df = DefaultedFields{};
    }
}