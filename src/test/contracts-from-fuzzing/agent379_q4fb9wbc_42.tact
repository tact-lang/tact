contract OptionalIntAsUint8 {
    a: Int? as uint8;

    init() {
        self.a = null;
    }
}