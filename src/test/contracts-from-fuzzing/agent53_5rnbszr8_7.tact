contract TestOptional {
    // Getter that returns an optional Int (here, always null)
    get fun getOptional(): Int? {
        return null;
    }

    receive() {
        // Call the getter
        let opt = self.getOptional();
    }
}
