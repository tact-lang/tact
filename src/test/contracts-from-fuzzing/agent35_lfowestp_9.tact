contract Test {
    // Boolean constant is valid
    const B: Bool = true;

    receive() {
        dump(self.B);
    }
}
