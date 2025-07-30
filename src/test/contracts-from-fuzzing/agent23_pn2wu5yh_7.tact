contract GetterOptional {
    receive() {}

    // Getter that returns an optional Int that is always null
    get fun getNull(): Int? {
        return null;
    }
}
