contract TestOptional {
    // Optional state variable, not initialized (defaults to none())
    maybe: Int?;

    // Getter that returns the optional state
    get fun getMaybe(): Int? {
        return self.maybe;
    }

    init() {
        // No initialization, so maybe remains 'none()'
    }

    receive() {}
}
