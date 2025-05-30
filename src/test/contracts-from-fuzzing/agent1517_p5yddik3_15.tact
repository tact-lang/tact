contract Test {
    word: String = "hello-world";

    init() {
        self.word = "goodbye";
    }

    receive() {}
}