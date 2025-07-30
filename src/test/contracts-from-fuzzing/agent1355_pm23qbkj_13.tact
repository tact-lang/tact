contract EdgeIntSerialization {
    small: Int as int8;
    big: Int as int257;

    init() {
        self.small = -128;
        self.big = 0;
    }
}