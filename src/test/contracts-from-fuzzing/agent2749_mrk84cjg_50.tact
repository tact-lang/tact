contract NegativeInUintBitfield {
    a: Int as uint4;
    
    init() {
        self.a = -15;
    }
}