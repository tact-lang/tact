struct NegativeDefaults {
    i8: Int as int8 = -128;
    i16: Int as int16 = -32768;
    i64: Int as int64 = -9223372036854775808;
}

contract NegativeTest {
    negs: NegativeDefaults = NegativeDefaults{};
}
