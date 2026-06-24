contract TestConstBool {
    const FLAG: Bool = true;

    receive() {
        if (self.FLAG) {
            // do nothing
        }
    }
}
