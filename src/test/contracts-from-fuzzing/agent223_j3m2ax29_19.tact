contract SerializeTypes {
    value1: Int as uint8;
    value2: Int as int64;
    value3: Int as coins;

    init() {
        self.value1 = 1;
        self.value2 = -64;
        self.value3 = 10_000_000;
    }
}