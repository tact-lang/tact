// test very long list of primitive persistent fields
contract ManyPrimitives {
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
    s1: String = "a";
    s2: String = "b";
    s3: String = "c";
    s4: String = "d";
    s5: String = "e";

    init() {
        self.i10 = 42;
        self.b4 = true;
        self.s5 = "z";
    }
}