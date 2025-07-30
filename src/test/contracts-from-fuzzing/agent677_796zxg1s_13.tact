struct OptSer {
    a: Int as uint8;
    b: Int?;
    c: Int as uint32;
}

contract TestOptSer {
    s: OptSer;

    init() {
        self.s = OptSer{ a: 1, b: null, c: 300 };
    }
}