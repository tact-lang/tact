struct Nest1 {
    a: Int;
    rem: Slice as remaining;
}

struct Nest2 {
    pre: Int;
    inner: Nest1;
    rem: Slice as remaining;
}

contract DoubleRem {
    st: Nest2;

    init() {
        self.st = Nest2 {
            pre: 1,
            inner: Nest1 { a:2, rem: emptyCell().asSlice() },
            rem: emptyCell().asSlice()
        };
    }
}