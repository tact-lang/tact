struct TinyBits {
    a: Int as uint1;
    b: Int as uint1;
    c: Int as uint1;
}

contract TinyBitsTest {
    val: TinyBits;

    init() {
        self.val = TinyBits{ a: 1, b: 0, c: 1 };
    }
}