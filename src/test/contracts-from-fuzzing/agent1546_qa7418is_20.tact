// Testing default for optional struct
struct Data {
    meaning: Int = 42;
    comment: String?;
}

contract OptionalWithDefaults {
    stored: Data?;

    init() {
        self.stored = null;
    }
}
