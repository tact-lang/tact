struct LongStruct {
    f01: Int = 1;
    f02: Int = 2;
    f03: Int = 3;
    f04: Int = 4;
    f05: Int = 5;
    f06: Int = 6;
    f07: Int = 7;
    f08: Int = 8;
    f09: Int = 9;
    f10: Int = 10;
    f11: Int = 11;
    f12: Int = 12;
    f13: Int = 13;
    f14: Int = 14;
    f15: Int = 15;
    f16: Int = 16;
}

contract ManyFieldsContract {
    s: LongStruct = LongStruct{};

    receive() {
        self.s = LongStruct{f01: 101, f02: 102, f03: 103, f04: 104, f05: 105, f06: 106, f07: 107, f08: 108, f09: 109, f10: 110, f11: 111, f12: 112, f13: 113, f14: 114, f15: 115, f16: 116};
    }
}