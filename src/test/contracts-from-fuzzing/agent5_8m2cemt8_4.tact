contract TestContract {
    receive() {
        let unicodeString = "Hello, 🌎!";
        dump(unicodeString);
    }
}