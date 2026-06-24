contract SerializationChecks {
    small: Int as uint4;
    negative: Int as int8;

    init() {
        self.small = 15;
        self.negative = -5;
    }
}