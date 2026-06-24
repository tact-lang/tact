contract IntSerializationInvalid {
    a: Int as int4;
    init() {
        self.a = 15;  // overflow: int4 range is -8..7
    }
}