struct Array8 {
    f1: Int as uint8;
    f2: Int as uint8;
    f3: Int as uint8;
    f4: Int as uint8;
    f5: Int as uint8;
    f6: Int as uint8;
    f7: Int as uint8;
    f8: Int as uint8;
}

contract ManySmallInts {
    stored: Array8;

    init() {
        self.stored = Array8{
            f1:1, f2:2, f3:3, f4:4, f5:5, f6:6, f7:7, f8:8
        };
    }
}