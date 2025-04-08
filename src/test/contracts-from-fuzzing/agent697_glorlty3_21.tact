contract LongStringField {
    s: String;

    init() {
        self.s = "This is a very long string used for testing serialization of string fields in contract persistent storage support.";
    }
}