contract TestUnicode {
    greeting: String = "Hello, \u{1F602} Tact!";

    receive() {
        dump(self.greeting);
    }
}