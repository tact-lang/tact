contract Test {
    const MY_CONSTANT: Int = 42;

    receive() {
         let sum: Int = self.MY_CONSTANT + 8;
    }
}
