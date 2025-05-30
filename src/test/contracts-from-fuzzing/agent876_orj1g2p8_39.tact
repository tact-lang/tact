contract OptionSerializationConflict {
    x: Int? as uint8;
    y: Int as uint8;
    init() {
        self.x = null;
        self.y = 5;
    }
}