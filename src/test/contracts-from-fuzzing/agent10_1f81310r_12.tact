contract TestContract {
    // Let's see if the compiler handles multiple emoji characters.
    bigEmoji: String = "🍕🍕🍕🍕🍕🍕";

    receive() {
        let x = self.bigEmoji;
        // no-op
    }
}
