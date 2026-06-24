contract MinIntField {
    minval: Int;

    init() {
        self.minval = -0x8000000000000000000000000000000000000000000000000000000000000000;
    }
}
