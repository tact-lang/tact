contract BoolTest {
    const FLAG: Bool = true;

    receive() {
        if (self.FLAG) {
            let x: Int = 1;
        } else {
            let x: Int = 0;
        }
    }
}
