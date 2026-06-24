contract MixedSerialization {
    i_signed: Int as int64 = -5;
    i_unsigned: Int as uint64 = 5;
    i_default: Int = 42;
    big_unsigned: Int as uint256 = 100;
    big_signed: Int as int257 = -100;
    small_unsigned: Int as uint8 = 255;
    small_signed: Int as int8 = -128;
    
    init() {}
}