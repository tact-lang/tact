// Persistent variable with explicit serialization hints
contract SerializationHints {
    small: Int as uint8;
    big: Int as int256;

    init() {
        self.small = 5;
        self.big = 123456789;
    }
}
