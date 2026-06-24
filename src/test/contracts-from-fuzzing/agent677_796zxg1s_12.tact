struct ManySer {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
}

contract SerTest {
    s: ManySer;

    init() {
        self.s = ManySer{ a: 1, b: -2, c: 300 };
    }
}