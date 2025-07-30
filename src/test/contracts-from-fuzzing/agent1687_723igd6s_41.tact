struct WeirdSerial {
    i1: Int as uint4;
    i2: Int as int3;
    i3: Int as uint7;
    i4: Int as int6;
    i5: Int as uint1;
    i6: Int as int1;
}

contract WeirdSizes {
    ws: WeirdSerial;

    init() {
        self.ws = WeirdSerial{
            i1: 5, i2: -3, i3: 100, i4: -25, i5:1, i6: -1
        };
    }
}