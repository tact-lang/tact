struct SerStruct {
    a: Int as int64;
    b: Int as uint8;
    c: Int as uint32;
    d: Int; // default 257 bits
}

contract TestContract {
    ser: SerStruct;

    init() {
        self.ser = SerStruct{ a: 1, b: 2, c: 3, d: 4 };
    }
}