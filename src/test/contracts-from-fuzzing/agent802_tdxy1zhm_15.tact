struct PaddedInts {
    a: Int as int8;
    b: Int as int16;
    c: Int as int32;
    d: Int as int64;
}

contract PaddingTest {
    storage: PaddedInts;

    init() {
        self.storage = PaddedInts{ a:1, b:2, c:3, d:4 };
    }
}