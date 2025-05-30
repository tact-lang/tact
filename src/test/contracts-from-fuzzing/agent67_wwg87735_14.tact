contract InitDefaults {
    counter: Int = 5;
    enabled: Bool = true;
    message: String = "hello";

    init() {
        self.counter = 10;
        self.enabled = false;
        self.message = "world";
    }
}
