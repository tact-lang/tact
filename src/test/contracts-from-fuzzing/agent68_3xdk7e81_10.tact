contract BoolTest {
    const FLAG: Bool = true;
    flag: Bool = self.FLAG;

    receive() {
        if (self.FLAG) {
            // branch executed if FLAG is true
        } else {
            // not reached
        }
    }
}
