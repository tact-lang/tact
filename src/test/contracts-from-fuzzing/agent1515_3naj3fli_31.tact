contract Serializers {
    i8: Int as int8;
    i16: Int as int16;
    i32: Int as int32;
    i64: Int as int64;

    init() {
        self.i8 = -128;
        self.i16 = -32768;
        self.i32 = -2147483648;
        self.i64 = -9223372036854775808;
    }
}