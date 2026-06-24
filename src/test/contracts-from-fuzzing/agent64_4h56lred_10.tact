struct SerialTest {
    tiny: Int as uint1;   // range 0..1
    big: Int as int257;  // full Int
    smallPos: Int as uint8;
    smallNeg: Int as int8;
}

contract SerialContract {
    data: SerialTest = SerialTest{
        tiny: 1,
        big: -123456789012345678901234567890,
        smallPos: 255,
        smallNeg: -128
    };
}