contract Test {
    const MY_CONSTANT: Int = 123;

    receive() {
       if (self.MY_CONSTANT > 0) { }
    }
}
