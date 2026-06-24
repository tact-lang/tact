contract MixStringOpt {
    regularString: String = "hello";
    optionalString: String? = null;

    init() {
        self.optionalString = "world";
    }
}