contract TestContract {
    i1: Int = 1;
    i2: Int = 2;
    i3: Int = 3;
    i4: Int = 4;
    i5: Int = 5;
    i6: Int = 6;
    i7: Int = 7;
    i8: Int = 8;
    i9: Int = 9;
    i10: Int = 10;
    i11: Int = 11;
    i12: Int = 12;
    i13: Int = 13;
    i14: Int = 14;
    i15: Int = 15;

    init() {
        self.i1 = 10;
        self.i15 = 150;
    }

    receive() {
        let _ = self.i15;
    }
}