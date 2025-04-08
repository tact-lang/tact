contract OptionalInStateInit {
    a: Int?;

    init() {
        self.a = null; // explicitly
    }

    receive() {}
}