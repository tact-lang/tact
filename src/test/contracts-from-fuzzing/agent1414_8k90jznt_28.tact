struct WeirdWidths {
    f1: Int as uint3;
    f2: Int as int5;
    f3: Int as uint6;
    f4: Int as int8;
    f5: Int as uint9;
}

contract WeirdWidthsContract {
    w: WeirdWidths;

    init() {
        self.w = WeirdWidths {
            f1: 7,   // 3 bits max
            f2: -16, // 5 bits
            f3: 63,  // 6 bits max
            f4: -128, 
            f5: 511  // 9 bits max
        };
    }
}