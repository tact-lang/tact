contract LargePrimitives {
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
    b1: Bool = true;
    b2: Bool = false;
    b3: Bool = true;
    b4: Bool = false;
    b5: Bool = true;

    receive() {
        let sum = self.i1 + self.i2 + self.i3 + self.i4 + self.i5 + self.i6 + self.i7 + self.i8 + self.i9 + self.i10;
    }
}