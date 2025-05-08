contract Test {
    const MY_CONSTANT: Int = 42;

    receive() {
        if (self.MY_CONSTANT > 0) {
            // do something
        }
    }
}
