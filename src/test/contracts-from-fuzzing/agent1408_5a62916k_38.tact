contract OptionalSerializationLimit {
    tiny: Int? as uint4;

    init() {
        self.tiny = 9;
    }
}