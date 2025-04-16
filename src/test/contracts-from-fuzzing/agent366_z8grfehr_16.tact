contract SerialOverride {
    tiny: Int as uint4;

    init() {
        self.tiny = 15; // max value for 4 bits uint
    }
}