contract TestModulo {
    receive() {
        let r: Int = 10 % 3; // expected remainder: 1
    }
}
