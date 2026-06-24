contract Test {
    const MY_CONSTANT: Int = 42;

    receive() {
         let y: Int = self.MY_CONSTANT;
    }
}
