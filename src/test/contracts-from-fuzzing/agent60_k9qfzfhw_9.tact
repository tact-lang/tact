contract TestConstString {
    const TXT: String = "Hello";

    receive() {
        let s: String = self.TXT;
    }
}
