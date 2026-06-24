contract OptionalWithSerialization {
    val: Int? as uint8;

    init() {
        self.val = 300; // out of uint8 range, triggers boundary check
    }
}