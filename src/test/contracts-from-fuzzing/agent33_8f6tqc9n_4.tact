contract Test {
    const MY_CONST: Int = 42;

    receive() {
        let a: Int = self.MY_CONST;
    }
}
