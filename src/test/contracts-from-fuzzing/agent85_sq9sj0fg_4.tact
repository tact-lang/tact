contract TestConstantCorrect {
    const MY_CONSTANT: Int = 42;

    receive() {
        let a: Int = self.MY_CONSTANT;
    }
}
