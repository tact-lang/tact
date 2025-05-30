struct NegIntSer {
    a: Int as int4;
    b: Int as int8;
    c: Int as int16;
    d: Int;
}

contract NegativeInts {
    s: NegIntSer;

    init() {
        self.s = NegIntSer{a:-5, b:-100, c:-1000, d:-5000};
    }
}