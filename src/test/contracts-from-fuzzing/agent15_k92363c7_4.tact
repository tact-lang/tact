contract TestContract {
    receive() {
        let str: String = "This contains a Unicode character: \u263A"; // ☺
    }
}