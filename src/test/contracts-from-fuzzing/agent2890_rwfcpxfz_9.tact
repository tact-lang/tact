struct SerialInts {
    a: Int as uint8;
    b: Int as int16;
    c: Int as int64;
    d: Int as coins;
}

contract SerialFieldTest {
    s: SerialInts;
    
    init() {
        self.s = SerialInts{ a:1, b:-2, c:3, d:ton("1") };
    }
}