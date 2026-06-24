contract TestBooleanConstant {
    const FLAG: Bool = true;

    receive() {
        if (self.FLAG) {
            return;
        }
    }
}
