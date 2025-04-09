contract UnicodeDefault {
    greeting: String = "Hello, 世界 👋🌍";

    init() {
        self.greeting = "Changed";
    }
}