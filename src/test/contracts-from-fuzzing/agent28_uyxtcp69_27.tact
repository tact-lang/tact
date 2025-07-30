contract ComplexConstDefaults {
    a: Int = 10 + 5 * 2 - 3;
    b: Int = pow(2, 8) + ton("1") - 1;
    c: Int = crc32("foo") & 0xFFFF_FFFF;
    d: Int = (crc32("1234") + 42) / 2;
    init() {}
}