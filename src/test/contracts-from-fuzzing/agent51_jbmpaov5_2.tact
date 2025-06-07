contract Test {
    var: Int = 0;

    receive() {
        // Test arithmetic operator precedence: multiplication has higher precedence than addition
        let a = 1 + 2 * 3; // expected to be 7
        self.var = a;
    }
}
