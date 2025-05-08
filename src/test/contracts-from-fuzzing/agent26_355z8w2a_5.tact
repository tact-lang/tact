contract TestStringConstant {
    const GREETING: String = "hello";

    receive() {
        if (self.GREETING == "hello") {
            return;
        }
    }
}
