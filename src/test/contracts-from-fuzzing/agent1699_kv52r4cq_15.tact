contract DefaultString {
    greeting: String = "hello";

    init() {
        self.greeting = "world";
    }
}