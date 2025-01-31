contract Test {
    const A: Int = self.C;
    const C: Int = self.A;

    get fun getConstant(): Int {
        return self.C;
    }
}
