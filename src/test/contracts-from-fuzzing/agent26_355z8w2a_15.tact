contract TestConstantDep {
    const A: Int = 10;
    const B: Int = self.A + 5;

    receive() {
        if (self.B == 15) {
            return;
        }
    }
}
