contract ExprTest {
    fun test() {
        let five = 5;
        let four = 4;
        // Operator precedence: five + four - five * four / five % four
        let result = five + four - five * four / five % four; // expected: 9
        dump(result);
    }

    receive() {
        self.test();
    }
}
