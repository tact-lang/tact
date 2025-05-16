contract OptionalAsSerialization {
    val: Int? as uint32;

    init() {
        self.val = null;
    }
}
