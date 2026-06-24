contract Test {
    const FLAG: Bool = true;

    receive() {
        if (self.FLAG) {
            // Branch taken if FLAG is true
            let a: Int = 1;
        } else {
            let a: Int = 0;
        }
    }
}
