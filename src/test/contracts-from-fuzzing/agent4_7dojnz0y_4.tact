contract TestContract {
    greeting: String = "Hello, Tact!";

    receive() {
        dump(self.greeting);
    }
}