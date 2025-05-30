struct WithSerializationDefaults {
    a: Int as uint8 = 0;
    b: Int as uint16 = 1;
    c: Int as int64 = -1;
}

contract SerializationDefaultsContract {
    data: WithSerializationDefaults;

    init() {
        self.data = WithSerializationDefaults{};
    }
}