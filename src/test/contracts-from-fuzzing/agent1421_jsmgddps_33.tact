struct SerialDefaults {
    a: Int as uint32 = 1;
    b: Int as int64 = -1;
    c: Int as uint8 = 0;
}

contract SerialStructTest {
    s: SerialDefaults = SerialDefaults{};
}