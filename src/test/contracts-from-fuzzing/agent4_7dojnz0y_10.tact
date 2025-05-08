contract TestMultiLine {
    greeting: String = "Hello
Tact!";

    receive() {
        dump(self.greeting);
    }
}