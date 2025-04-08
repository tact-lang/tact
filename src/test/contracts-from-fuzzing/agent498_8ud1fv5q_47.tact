contract IntSerializationFailLate {
    a: Int as uint8;
    init() {
        self.a = -1;
        self.a = 5;
    }
}