contract Test {
    const CONSTANT: Int = 123;

    receive() {
        let x: Int = self.CONSTANT + 1;
    }
}
