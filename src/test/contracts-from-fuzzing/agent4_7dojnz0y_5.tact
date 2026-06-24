contract TestEscapeSeq {
    greeting: String = "Line1\nLine2";

    receive() {
        dump(self.greeting);
    }
}