contract TestContract {
    receive() {
        let s: String = "Valid hex: \x1F";
        s;
    }
}
