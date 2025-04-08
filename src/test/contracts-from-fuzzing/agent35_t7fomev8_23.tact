// large contract, many Bool + Int fields
contract TestContract {
    b1: Bool = true;
    b2: Bool = false;
    b3: Bool = true;
    b4: Bool = false;
    b5: Bool = true;
    b6: Bool = false;
    b7: Bool = true;
    b8: Bool = false;
    b9: Bool = true;
    b10: Bool = false;
    
    i1: Int = 0;
    i2: Int = 0;
    i3: Int = 0;
    i4: Int = 0;
    i5: Int = 0;
    i6: Int = 0;
    i7: Int = 0;
    i8: Int = 0;
    i9: Int = 0;
    i10: Int = 0;

    init() {
        self.b1 = false; self.b2 = true; self.b3 = false; self.b4 = true; self.b5 = false;
        self.b6 = true; self.b7 = false; self.b8 = true; self.b9 = false; self.b10 = true;
        
        self.i1 = 1; self.i2 = 2; self.i3 = 3; self.i4 = 4; self.i5 = 5;
        self.i6 = 6; self.i7 = 7; self.i8 = 8; self.i9 = 9; self.i10 = 10;
    }
}
