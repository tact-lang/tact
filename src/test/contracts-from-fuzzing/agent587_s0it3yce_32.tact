contract PrimitiveMix {
    i1: Int = 1;
    b1: Bool = true;
    i2: Int = 2;
    b2: Bool = false;
    init() {
        self.i1=1; self.i2=2;
        self.b1=false; self.b2=true;
    }
    receive() {
        let _ = self.i1 + self.i2;
    }
}