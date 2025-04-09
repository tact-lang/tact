contract IntSerializationFields {
    small: Int as uint4 = 7;   // 4 bits unsigned
    med: Int as uint32 = 65535; // 32 bits unsigned
    large: Int as int257 = 0;   // full 257 bits signed
}