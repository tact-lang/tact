struct SerializeTest {
    a: Int as uint8;
    b: Int as int16;
    c: Int as int64;
    d: Int as coins;
}

contract SerContract {
    s: SerializeTest;
    init() {
        self.s = SerializeTest{a:1,b:2,c:3,d:4};
    }
}
