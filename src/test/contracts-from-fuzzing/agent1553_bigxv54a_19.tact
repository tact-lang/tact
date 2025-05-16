contract NegativeDefaults {
    a: Int as int8 = -128;
    b: Int as int16 = -32768;
    c: Int as int32 = -2147483648;
    d: Int as int64 = -9223372036854775808;
    e: Int = -1;

    init() {}
}