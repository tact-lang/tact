struct Packed {
    a: Int as uint8;
    b: Int as int16;
    c: Int as coins;
}

contract Test {
    data: Packed;

    init() {
        self.data = Packed{ a:1, b:2, c:3 };
    }
}