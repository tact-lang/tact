struct Ser {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint24;
    d: Int as int64;
}

contract TestContract {
    ser: Ser;
    init() {
        self.ser = Ser{ a:1,b:2,c:3,d:4 };
    }
}