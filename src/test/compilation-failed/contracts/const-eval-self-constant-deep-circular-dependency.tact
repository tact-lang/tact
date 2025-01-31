contract Test {
    const A: Int = self.E;
    const B: Int = self.A;
    const C: Int = self.B;
    const D: Int = self.C;
    const E: Int = self.D;

    get fun getConstant(): Int {
        return self.E;
    }
}
