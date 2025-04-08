contract OptionalInit {
    a: Int?;

    init() {
        self.a = null;
    }

    receive() {
        self.a = 10;
    }
}