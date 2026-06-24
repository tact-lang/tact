contract TestContract {
    receive() {
        let message: String = "Hello, Tact!";
        dump(message);
    }
}