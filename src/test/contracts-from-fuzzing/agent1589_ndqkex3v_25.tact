contract WithIntConsts {
    const A: Int = 0;
    const B: Int = 1;
    const C: Int = 2;

    var1: Int;
    var2: Int;

    init() {
        self.var1 = self.A;
        self.var2 = self.B + self.C;
    }
}