contract TestEmptyString {
    greeting: String = "";

    receive() {
        dump(self.greeting);
    }
}