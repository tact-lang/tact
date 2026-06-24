// Test contract with giant amount of booleans to check bit layout
contract BoolHoard {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
    b5: Bool;
    b6: Bool;
    b7: Bool;
    b8: Bool;
    b9: Bool;
    b10: Bool;
    b11: Bool;
    b12: Bool;
    b13: Bool;
    b14: Bool;
    b15: Bool;
    b16: Bool;
    
    init() {
        self.b1 = true; self.b2 = true; self.b3 = false; self.b4 = true;
        self.b5 = false; self.b6 = true; self.b7 = false; self.b8 = true;
        self.b9 = false; self.b10 = true; self.b11 = false; self.b12 = true;
        self.b13 = false; self.b14 = true; self.b15 = false; self.b16 = true;
    }
}