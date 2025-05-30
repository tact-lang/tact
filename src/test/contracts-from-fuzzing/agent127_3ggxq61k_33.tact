contract OptionalStringDefaultNonNull {
    str: String? = "hello";

    init() {
        self.str = "world";
    }
}