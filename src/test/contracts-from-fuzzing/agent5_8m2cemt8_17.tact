contract TestContract {
    const str: String = "This is a big constant string with more than 64 characters. Let's see if it's allowed by Tact.";

    receive() {
        dump(self.str);
    }
}