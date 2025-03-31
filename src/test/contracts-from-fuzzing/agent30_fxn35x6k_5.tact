contract TestContract {
    receive() {
        let num: Int = ascii("a"); // Length 1
        let numLong: Int = ascii("abcdefghijklmnopqrstuvwxyz"); // Length 26
    }
}