struct NestedInner {
    n: Int as uint32;
    m: Int as int16;
}

contract NestedSerialization {
    c: Int as uint8;
    s: NestedInner;

    init() {
        self.c = 5;
        self.s = NestedInner{ n:123, m:-12 };
    }
}