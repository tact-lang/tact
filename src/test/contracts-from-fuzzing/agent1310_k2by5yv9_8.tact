struct MixedInts {
    a: Int;
    b: Int as uint8;
    c: Int as uint64;
}

contract TestContract {
    m: MixedInts;

    init() {
        self.m = MixedInts{ a: 42, b: 7, c: 123456 };
    }
}
