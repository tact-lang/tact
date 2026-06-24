struct BigInner {
    i1: Int;
    i2: Int;
    i3: Int;
    i4: Int;
    i5: Int;
    i6: Int;
}

contract DirectBigState {
    s: BigInner;
    init() {
        self.s = BigInner{
            i1: 1,
            i2: 2,
            i3: 3,
            i4: 4,
            i5: 5,
            i6: 6
        };
    }
}