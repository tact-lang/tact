contract OptionalStringDefault {
    message: String? = "hello";

    init() {
        self.message = "world";
    }
}
