struct SerialPacked {
    a: Int as uint8;
    b: Int as uint8;
    c: Int as uint8;
    d: Int as uint8;
}

contract PackedTest {
    v: SerialPacked;
    init() {
        self.v = SerialPacked{a:1,b:2,c:3,d:4};
    }
}