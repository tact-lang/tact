struct Optionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalStructWithDefaults {
    s: Optionals;

    init() {
        self.s = Optionals{};
    }
}