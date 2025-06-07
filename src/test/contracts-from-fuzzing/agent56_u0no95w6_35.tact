contract OptionalSerialized {
    count: Int? as uint8;

    init() {
        self.count = null;
    }
}