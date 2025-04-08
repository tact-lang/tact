contract EdgeSerialization {
    minInt64: Int as int64;
    maxInt64: Int as int64;

    init() {
        self.minInt64 = -9223372036854775808;
        self.maxInt64 = 9223372036854775807;
    }
}
