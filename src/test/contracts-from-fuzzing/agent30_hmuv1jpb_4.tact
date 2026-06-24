contract TestString {
    const GREETING: String = "Hello, TON!";

    get fun greet(): String {
        return self.GREETING;
    }
}
