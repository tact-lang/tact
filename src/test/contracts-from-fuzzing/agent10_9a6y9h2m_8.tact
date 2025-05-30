contract Test {
    const MY_CONSTANT: Int = 42;

    receive() {
         // Test using constant in an arithmetic expression
         let x: Int = self.MY_CONSTANT + 0;
         x;
    }
}
