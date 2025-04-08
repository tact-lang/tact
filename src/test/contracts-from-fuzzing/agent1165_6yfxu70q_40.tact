struct ManySerialInts {
    a: Int as uint4;
    b: Int as uint8;
    c: Int as int12;
    d: Int as uint20;
    e: Int as int32;
    f: Int as uint64;
}

contract MiniSerialized {
    pack: ManySerialInts;

    init() {
        self.pack = ManySerialInts{ a: 1, b: 2, c: -3, d: 4, e: -5, f: 6 };
    }
}
