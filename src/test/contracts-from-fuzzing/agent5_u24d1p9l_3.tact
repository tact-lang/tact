contract Test {
    const MY_CONST: Int = 42;

    receive() {
        // use constant as a field via self
        let x: Int = self.MY_CONST;
    }
}
