contract OptionalSerialize {
    num: Int? as uint8;

    init() {
        self.num = null;
    }
}