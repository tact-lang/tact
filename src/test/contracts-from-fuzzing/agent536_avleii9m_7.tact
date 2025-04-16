contract StringDefault {
    greeting: String = "Hello";

    init() {
        self.greeting = "Hi";
    }
}