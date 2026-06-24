contract Test {
    const MY_CONSTANT: Int = 42;

    receive() {
         let x: Int = self.MY_CONSTANT;
    }
}
