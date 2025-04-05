contract TestLiteralString {
    receive() {
        let a: String = "Hello, World!";
        let b: String = "A \n new line";
        dump(a);
        dump(b);
    }
}
