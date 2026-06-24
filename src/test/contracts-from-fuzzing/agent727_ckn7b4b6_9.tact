contract WithBigString {
    greeting: String = "Hello world, fuzz testing";

    init() {
        self.greeting = "Hello fuzz world!";
    }
}
