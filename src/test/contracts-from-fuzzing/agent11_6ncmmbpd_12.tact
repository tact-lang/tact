contract Test {
    v: Int = 10;
    receive() {
        self.v += 5; // augmented assignment for addition
        dump(self.v); // expected output: 15
    }
}
