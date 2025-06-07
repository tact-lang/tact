contract EdgeSignedUnsigned {
    intVal: Int as int64;
    uintVal: Int as uint64;

    init() {
        self.intVal = -9223372036854775808; // Minimum int64
        self.uintVal = 18446744073709551615; // Maximum uint64
    }
}
