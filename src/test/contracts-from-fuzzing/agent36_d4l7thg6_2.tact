contract TestText {
    state: String = "";

    receive("hello") {
        self.state = "received hello";
    }
}
