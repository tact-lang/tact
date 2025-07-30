struct SerializeWidths {
    a: Int as int1;
    b: Int as uint1;
    c: Int as int8;
    d: Int as uint8;
    e: Int as int16;
    f: Int as uint16;
    g: Int as int257;
}

contract TestContract {
    s: SerializeWidths;
    
    init() {
        self.s = SerializeWidths{
            a: 0,
            b: 1,
            c: -128,
            d: 255,
            e: -32768,
            f: 65535,
            g: 0
        };
    }
}