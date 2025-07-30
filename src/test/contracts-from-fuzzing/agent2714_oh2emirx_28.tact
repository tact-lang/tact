contract Test28 {
    intVal: Int as int128;
    uintVal: Int as uint128;

    init() {
        self.intVal = -1234567890123456789;
        self.uintVal = 1234567890123456789;
    }
}