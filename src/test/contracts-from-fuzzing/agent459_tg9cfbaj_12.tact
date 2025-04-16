struct MixedInts {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
}

contract MixedIntStorage {
    data: MixedInts = MixedInts{ a:1, b:-2, c:3, d:-4 };

    init() {
        self.data = MixedInts{ a:255, b:32767, c:123456789, d:-999999 }
    }
}