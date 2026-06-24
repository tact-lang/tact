struct EmbeddedAndField {
    i: Int;
    b: Bool;
}

contract DoubleStored {
    e: EmbeddedAndField;
    b2: Bool;
    
    init() {
        self.e = EmbeddedAndField{ i: 1, b: true };
        self.b2 = false;
    }
}
