struct ManySerializations {
    a: Int as uint1;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint32;
    e: Int as coins;
    f: Int;
}

contract SerializationsTest {
    ser: ManySerializations;

    init() {
        self.ser = ManySerializations{
            a:1,b:2,c:3,d:4,e:5,f:6
        };
    }
}