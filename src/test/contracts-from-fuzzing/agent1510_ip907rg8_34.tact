struct SerialDefaults {
    i: Int as int32 = 42;
    u: Int as uint64 = 15;
}

contract SerializationDefaults {
    s: SerialDefaults;

    init() {
        self.s = SerialDefaults{};
    }
}