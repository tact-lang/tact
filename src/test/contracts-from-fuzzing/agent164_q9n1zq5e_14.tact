contract TestContract {
    greeting: String?;

    receive() {
        if (self.greeting != null) {
            let _ = self.greeting!!;
        }
    }
}