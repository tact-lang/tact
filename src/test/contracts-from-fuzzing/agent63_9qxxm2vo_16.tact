contract OptString {
    info: String? = null;
    counter: Int = 0;

    init() {
        self.counter = 1;
        self.info = "hello";
    }
}