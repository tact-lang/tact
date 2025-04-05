contract TestSelf {
    const MYCONST: Int = 100;
    receive() {
        // Test self literal: accessing a contract-level constant via self
        dump(self.MYCONST);
    }
}
