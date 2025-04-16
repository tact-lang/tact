contract SerializationFormats {
    valU8: Int as uint8;
    valI16: Int as int16;
    valU64: Int as uint64;
    flag: Bool;

    init() {
        self.valU8 = 255;
        self.valI16 = -32768;
        self.valU64 = 10000000000;
        self.flag = true;
    }
}