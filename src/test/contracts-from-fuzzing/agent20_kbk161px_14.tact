contract TestContract {
    receive() {
        let s: String = "Hello\rWorld";
        s.hashData();
    }
}