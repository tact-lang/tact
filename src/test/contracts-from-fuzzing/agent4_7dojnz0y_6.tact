contract TestEscapeHex {
    greeting: String = "Hello \x22 Tact!\x22";

    receive() {
        dump(self.greeting);
    }
}