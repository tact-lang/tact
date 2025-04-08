contract LongStringField {
    s: String;

    init() {
        self.s = "This is a very very long string, designed to test serialization and handling of large string fields in contract persistent state. It should be stored and loaded correctly.";
    }
}