struct MixedSerial {
    tinyInt: Int as int1;
    smallInt: Int as uint8;
    normalInt: Int;
    flag1: Bool;
    flag2: Bool;
}

contract MixedSerialization {
    s: MixedSerial = MixedSerial{
        tinyInt: 1,
        smallInt: 8,
        normalInt: 12345,
        flag1: true,
        flag2: false
    };

    receive() {
        self.s = self.s;
    }
}