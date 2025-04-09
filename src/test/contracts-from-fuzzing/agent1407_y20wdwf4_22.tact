struct SmallInts {
    a: Int as uint4;
    b: Int as uint8;
    c: Int as int4;
}

contract TestContract {
    s: SmallInts;

    init() {
        self.s = SmallInts{ a:7, b:255, c:-8 };
    }
}