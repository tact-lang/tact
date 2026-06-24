contract MixedSizes {
    bigInt: Int = 123456789012345678901234567890;
    smallInt: Int as uint8 = 255;
    negInt: Int = -42;
    posInt: Int as int16 = 32767;
}