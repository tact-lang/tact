contract MixedWidthsRemaining {
    s: S;

    init() {
        self.s = S{
            a: 1,
            b: -5,
            c: 12345,
            tail: "end".asSlice()
        };
    }
}

struct S {
    a: Int as uint4;
    b: Int as int8;
    c: Int as uint32;
    tail: Slice as remaining;
}
