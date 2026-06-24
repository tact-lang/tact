contract TestContract {
    receive() {
        let s: String = "This is a line break:\nSecond Line";
        dump(s);
    }
}