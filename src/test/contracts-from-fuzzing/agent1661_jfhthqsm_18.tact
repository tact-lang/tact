struct SmallInts {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as uint32;
}

contract SerialTest {
    s: SmallInts = SmallInts{a:10, b:20, c:30};

    init() {
        self.s = SmallInts{a:1, b:2, c:3};
    }
}