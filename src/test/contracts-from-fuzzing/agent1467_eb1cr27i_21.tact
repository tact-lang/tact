struct SerializeSigned {
    s8: Int as int8;
    s16: Int as int16;
    s32: Int as int32;
    s64: Int as int64;
}

contract SignedSerialize {
    data: SerializeSigned;
    init() {
        self.data = SerializeSigned{
            s8: -128,
            s16: -32768,
            s32: -2147483648,
            s64: -9223372036854775808
        };
    }
}